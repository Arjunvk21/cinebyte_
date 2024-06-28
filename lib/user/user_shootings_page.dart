import 'dart:io';

import 'package:cinebyte_network_application/firebase/shootingsService.dart';
import 'package:cinebyte_network_application/model/shootingsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class user_shootings_page extends StatefulWidget {
  user_shootings_page({super.key});

  @override
  State<user_shootings_page> createState() => _user_shootings_pageState();
}

class _user_shootings_pageState extends State<user_shootings_page> {
  File? selectedFile;
  Stream? shootStream;
  Future<void> _pickedImageGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    setState(() {
      selectedFile = File(pickedImage.path);
    });
  }

  getShoodStream() {
    shootStream =
        FirebaseFirestore.instance.collection('shootings').snapshots();
  }

  shootingService shoot = shootingService();
  shootingsModel shootmod = shootingsModel();
  @override
  void initState() {
    // TODO: implement initState
    getShoodStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: StreamBuilder(
          stream: shoot.getAllShootings(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Something Error Occured',
                  style: GoogleFonts.fugazOne(color: Colors.white),
                ),
              );
            }
            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'No Data Found',
                  style: GoogleFonts.fugazOne(color: Colors.white),
                ),
              );
            }
            List<shootingsModel> ds = snapshot.data ?? [];
            if (snapshot.hasData ) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final shoot = ds[index];
                  return Center(
                      child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: Color.fromARGB(255, 234, 210, 178),
                        ),
                        clipBehavior: Clip.hardEdge,
                        // ignore: sort_child_properties_last
                        child: Card(
                          elevation: 10,
                          child: Image.network(
                            '${shoot.ShootingImage}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: width,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 280,top: 200),
                        child: IconButton(
                            onPressed: () {
                              // final id = ${shoot.shootingId};
                              shootingService shootDelete = shootingService();
                              shootDelete.deleteshootings(shoot.shootingId);
                            },
                            icon: Icon(Icons.delete, color: const Color.fromARGB(255, 234, 210, 178),)),
                      ),
                    ],
                  ));
                },
                itemCount: snapshot.data!.length,
              );
            }
            return Center(
              child: Text(
                'Something Error Occured',
                style: GoogleFonts.fugazOne(color: Colors.white),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pickedImageGallery().then((value) async {
            SettableMetadata metadata =
                SettableMetadata(contentType: 'image/jpeg');
            final currenttime = TimeOfDay.now();
            UploadTask uploadTask = FirebaseStorage.instance
                .ref()
                .child('shootimage/shoot$currenttime')
                .putFile(selectedFile!, metadata);
            TaskSnapshot snapshot = await uploadTask;
            await snapshot.ref.getDownloadURL().then((url) {
              String id = FirebaseAuth.instance.currentUser!.uid;
              var shootID = const Uuid().v1();
              shootingsModel shootingmodel = shootingsModel(
                  shootingId: shootID, ShootingImage: url, userId: id);
              shootingService service = shootingService();
              service.createShootings(shootingmodel);
            });
          });
        },
        backgroundColor: const Color.fromARGB(255, 234, 210, 178),
        child: const Icon(Icons.add),
      ),
    );
  }
}
