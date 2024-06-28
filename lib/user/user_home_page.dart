// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinebyte_network_application/production%20house/get_started_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_feedback_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_user_profile.dart';
import 'package:cinebyte_network_application/production%20house/sign_in.dart';
import 'package:cinebyte_network_application/user/gallery_page.dart';
import 'package:cinebyte_network_application/user/map_page.dart';
import 'package:cinebyte_network_application/user/notifications_page.dart';
import 'package:cinebyte_network_application/user/skill_upload_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class user_home_page extends StatefulWidget {
  const user_home_page({super.key});

  @override
  State<user_home_page> createState() => user_home_pageState();
}

final _firstor = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

Stream? userStream;

getOnLoad() {}

class user_home_pageState extends State<user_home_page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    String id = _auth.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        title: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            'Home',
            style: GoogleFonts.fugazOne(color: Colors.white),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 15),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => map_page())));
                },
                icon: const Icon(Icons.add_location_alt_sharp)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 15),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const notifications_page(),
                  ));
                },
                icon: const Icon(Icons.notifications)),
          )
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: _firstor.collection('users').doc(id).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  DocumentSnapshot data = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Container(
                      margin: const EdgeInsets.only(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 234, 210, 178),
                      ),
                      width: width,
                      height: 170,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 20),
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      NetworkImage('${data['image']}'),
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${data['name']}",
                                  style: GoogleFonts.acme(
                                      fontSize: 20,
                                      color: const Color.fromARGB(
                                          255, 33, 33, 33)),
                                ),
                                Text(
                                  '${data['email']}',
                                  style: GoogleFonts.acme(fontSize: 15),
                                ),
                                Text(
                                  'Skill : ${data['skill']}',
                                  style: GoogleFonts.acme(fontSize: 15),
                                ),
                                Text(
                                  'Experience : ${data['experience']}',
                                  style: GoogleFonts.acme(fontSize: 15),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 150),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => skill_upload(),
                                        ));
                                      },
                                      icon: const Icon(
                                        Icons.add_card_rounded,
                                        color: Color.fromARGB(255, 33, 33, 33),
                                      )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CarouselSlider(
                items: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.amber[200],
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://imagesvs.oneindia.com/webp/img/2024/02/bramayugam-small-1707971334.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.amber[200],
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://indiaglitz-media.s3.amazonaws.com/telugu/home/the-goat-life-review-1.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.amber[200],
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://static.toiimg.com/thumb/msid-107578203,width-1280,height-720,resizemode-4/107578203.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.8,
                )),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const production_house_user_profile_page(),
                    )),
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 234, 210, 178),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 33, 33, 33),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Profile',
                                style: GoogleFonts.fugazOne(
                                    color:
                                        const Color.fromARGB(255, 33, 33, 33),
                                    fontSize: 18),
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const production_house_user_profile_page(),
                                  ));
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Color.fromARGB(255, 33, 33, 33),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const gallery_page(),
                    )),
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 234, 210, 178),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.storage,
                              color: Color.fromARGB(255, 33, 33, 33),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Gallery',
                                style: GoogleFonts.fugazOne(
                                    color:
                                        const Color.fromARGB(255, 33, 33, 33),
                                    fontSize: 18),
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const gallery_page(),
                                  ));
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Color.fromARGB(255, 33, 33, 33),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const production_house_feedback_page(),
                    )),
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 234, 210, 178),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.feedback,
                              color: Color.fromARGB(255, 33, 33, 33),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'Feedback',
                                style: GoogleFonts.fugazOne(
                                    color:
                                        const Color.fromARGB(255, 33, 33, 33),
                                    fontSize: 18),
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const production_house_feedback_page(),
                                  ));
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Color.fromARGB(255, 33, 33, 33),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const get_started_page(),
                    )),
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 234, 210, 178),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.logout,
                              color: Color.fromARGB(255, 33, 33, 33),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                'logout',
                                style: GoogleFonts.fugazOne(
                                    color:
                                        const Color.fromARGB(255, 33, 33, 33),
                                    fontSize: 18),
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Sign_in_page(),
                                  ));
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Color.fromARGB(255, 33, 33, 33),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
