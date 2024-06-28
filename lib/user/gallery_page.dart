// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:math';

import 'package:cinebyte_network_application/model/gallery_model.dart';
import 'package:cinebyte_network_application/production%20house/production_house_settings_page.dart';
import 'package:cinebyte_network_application/user/sinlge_post_view_page.dart';
import 'package:cinebyte_network_application/user/upload_post.dart';
import 'package:cinebyte_network_application/user/user_home_page.dart';
import 'package:cinebyte_network_application/user/user_menu_page.dart';
import 'package:cinebyte_network_application/user/user_schedules_page.dart';
import 'package:cinebyte_network_application/user/user_settings.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class gallery_page extends StatefulWidget {
  const gallery_page({super.key});

  @override
  State<gallery_page> createState() => _gallery_pageState();
}

File? selectedimage;
int bottomnavigation_indexnumber = 2;

class _gallery_pageState extends State<gallery_page> {
  @override
  Widget build(BuildContext context) {
    String userid = FirebaseAuth.instance.currentUser!.uid;
    final List postslist = [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 1, 3, 14];
    Future<void> pickedimagegallery() async {
      final pickedimage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedimage == null) return;
      setState(() {
        selectedimage = File(pickedimage.path);
      });
    }

    return Scaffold(
      appBar: Custom_appbar_real(title: 'Gallery'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50),
            child: Text(
              'Posts',
              style: GoogleFonts.fugazOne(color: Colors.white, fontSize: 18),
            ),
          ),
          Expanded(
              child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('gallery')
                .where('userid', isEqualTo: userid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error occured'),
                );
              }
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    final gallery =
                        galleryModel.fromjson(snapshot.data!.docs[index]);
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => single_post_view_page(
                                    imageUrl: gallery.postdata)),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 50,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage('${gallery.postdata}')),
                          ),

                          // margin: EdgeInsets.only(),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              }
              return Center(
                child: Text(
                  'No posts added',
                  style: GoogleFonts.fugazOne(color: Colors.white),
                ),
              );
            },
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UploadPostPage(),
          ));
          // pickedimagegallery();
        },
        backgroundColor: Color.fromARGB(255, 234, 210, 178),
        child: Icon(Icons.add),
      ),
    );
  }
}
