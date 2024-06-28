// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:cinebyte_network_application/production%20house/production_house_home_page.dart';
import 'package:cinebyte_network_application/user/bottomnav.dart';
import 'package:cinebyte_network_application/user/user_home_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:random_string/random_string.dart';

class production_house_user_profile_page extends StatefulWidget {
  const production_house_user_profile_page({super.key});

  @override
  State<production_house_user_profile_page> createState() =>
      _production_house_user_profile_pageState();
}

// ignore: camel_case_types
class _production_house_user_profile_pageState
    extends State<production_house_user_profile_page> {
  // final _auth = FirebaseAuth.instance;
  final _firstor = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final CollectionReference Users =
      FirebaseFirestore.instance.collection('users');
  bool _isEditing = false;

  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  File? selectedimage;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    Future<void> _pickedImageGallery() async {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      setState(() {
        selectedimage = File(pickedImage.path);
      });
    }

    void UpdateProfiles(id) {
      final data = {
        'name': _usernamecontroller.text,
        'email': _emailcontroller.text,
      };
      Users.doc(id).update(data);
    }

    String id = _auth.currentUser!.uid;
    return Scaffold(
      appBar:  Custom_appbar_real(title: 'User Profile'),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: _firstor.collection('users').doc(id).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                Center(
                  child: CircularProgressIndicator(),
                );
              }

              DocumentSnapshot data = snapshot.data!;

              _usernamecontroller.text = data['name'] ?? '';
              _emailcontroller.text = data['email'] ?? '';
              _passwordcontroller.text = data['password'] ?? '';
              return Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: selectedimage != null
                                            ? FileImage(selectedimage!)
                                            : NetworkImage('${data['image']}')
                                                //  AssetImage('images/download.jpg')

                                                as ImageProvider<Object>)),
                                child: IconButton(
                                    onPressed: () {
                                      _pickedImageGallery().then((value) async {
                                        SettableMetadata metadata =
                                            SettableMetadata(
                                                contentType: 'image/jpeg');
                                        final currenttime = TimeOfDay.now();
                                        UploadTask uploadTask = FirebaseStorage
                                            .instance
                                            .ref()
                                            .child(
                                                'profileimage/profile$currenttime')
                                            .putFile(selectedimage!, metadata);
                                        TaskSnapshot snapshot =
                                            await uploadTask;
                                        await snapshot.ref
                                            .getDownloadURL()
                                            .then((url) {
                                          String id = FirebaseAuth
                                              .instance.currentUser!.uid;
                                          FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(id)
                                              .update({'image': url});
                                        });
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.photo_camera,
                                      color: Color(0xff2D3037),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 480,
                    height: 430,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(
                              0.5), // Shadow color with transparency
                          blurRadius: 5.0, // Blur radius of the shadow
                          spreadRadius:
                              2.0, // Spread radius (optional) to enlarge the shadow
                          offset: const Offset(2.0,
                              4.0), // Offset the shadow in x and y directions
                        ),
                      ],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(50),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _usernamecontroller,
                              readOnly: !_isEditing,
                              // initialValue: '${data['name']}',
                              style: GoogleFonts.acme(color: Colors.white),
                              decoration: InputDecoration(
                                label: Text(
                                  'Username',
                                  style: GoogleFonts.fugazOne(),
                                ),
                                prefixIcon:
                                    const Icon(Icons.account_circle_rounded),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isEditing = !_isEditing;
                                    });
                                    log('${data['name']}');
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _emailcontroller,
                              keyboardType: TextInputType.emailAddress,
                              // initialValue: '${data['email']}',
                              // controller: _emailcontroller,
                              readOnly: !_isEditing,
                              style: GoogleFonts.acme(color: Colors.white),
                              decoration: InputDecoration(
                                label: Text(
                                  'Email',
                                  style: GoogleFonts.fugazOne(),
                                ),
                                prefixIcon: const Icon(Icons.email_rounded),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isEditing = !_isEditing;
                                    });
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              readOnly: !_isEditing,

                              controller: _passwordcontroller,
                              // initialValue: '${data['password']}',
                              style: GoogleFonts.acme(color: Colors.white),
                              decoration: InputDecoration(
                                  label: Text(
                                    'Password',
                                    style: GoogleFonts.fugazOne(),
                                  ),
                                  prefixIcon: const Icon(Icons.lock_rounded),
                                  suffixIcon: const Icon(Icons.edit)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                          Color.fromARGB(255, 234, 210, 178),
                                        ),
                                        minimumSize: MaterialStatePropertyAll(
                                          Size(width, 50),
                                        )),
                                    onPressed: () {
                                      UpdateProfiles(id);
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) =>
                                              const custombottomnavigationbar()));
                                    },
                                    child: Text(
                                      "Save Changes",
                                      style: GoogleFonts.fugazOne(
                                          color: const Color.fromARGB(
                                              255, 46, 53, 62),
                                          fontSize: 18),
                                    )),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              );
            }),
      ),
    );
  }
}
