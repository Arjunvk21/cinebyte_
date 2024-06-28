// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinebyte_network_application/firebase/firestore.dart';
import 'package:cinebyte_network_application/production%20house/get_started_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_feedback_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_menu_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_schedules_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_settings_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_user_profile.dart';
import 'package:cinebyte_network_application/user/map_page.dart';
import 'package:cinebyte_network_application/user/notifications_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class production_house_home_page extends StatefulWidget {
  const production_house_home_page({super.key});

  @override
  State<production_house_home_page> createState() =>
      _production_house_home_pageState();
}

class _production_house_home_pageState
    extends State<production_house_home_page> {
  final _firstor = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  int bottomnavigation_indexnumber = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    String id = _auth.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Home',
            style: GoogleFonts.fugazOne(color: Colors.white),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => map_page(),
                  ));
                },
                icon: Icon(Icons.add_location_alt_sharp)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 15),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => notifications_page(),
                  ));
                },
                icon: Icon(Icons.notifications)),
          )
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FutureBuilder(
              future: firebaseHelper().fetchuser(_auth.currentUser!.uid),
              builder: (context, snapshot) {
                final data = snapshot.data;

                return Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Container(
                    margin: EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromARGB(255, 234, 210, 178),
                    ),
                    width: width,
                    height: 160,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 20),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPzVgo3yqoEmk3EEo2WPIDK7W5n4Mk_vinDYtsDKmfGg&s'),
                              )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "hi",
                                style: GoogleFonts.acme(fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                   '',
                                  style: GoogleFonts.acme(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 70,
                                ),
                                child: Text(
                                  '+91 9454737782',
                                  style: GoogleFonts.acme(fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 150),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add_card_rounded)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.amber[200],
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://imagesvs.oneindia.com/webp/img/2024/02/bramayugam-small-1707971334.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ],
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.8,
                )),
            SizedBox(
              height: 50,
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 234, 210, 178),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Profile',
                        style: GoogleFonts.fugazOne(
                            color: Color.fromARGB(255, 46, 53, 62),
                            fontSize: 18),
                      ),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                production_house_user_profile_page(),
                          ));
                        },
                        icon: Icon(Icons.arrow_circle_right_sharp)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 234, 210, 178),
              ),
              child: ListTile(
                leading: Icon(Icons.feedback),
                title: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Feedback',
                    style: GoogleFonts.fugazOne(
                        color: Color.fromARGB(255, 46, 53, 62), fontSize: 18),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => production_house_feedback_page(),
                      ));
                    },
                    icon: Icon(Icons.arrow_circle_right_sharp)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color.fromARGB(255, 234, 210, 178),
              ),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Logout',
                    style: GoogleFonts.fugazOne(
                        color: Color.fromARGB(255, 46, 53, 62), fontSize: 18),
                  ),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const get_started_page(),
                      ));
                    },
                    icon: const Icon(Icons.arrow_circle_right_sharp)),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: [
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => production_house_home_page(),
                      )),
                  child: Icon(Icons.home)),
              label: 'home',
              backgroundColor: Color.fromARGB(255, 16, 16, 16)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => production_page_menu_page(),
                      )),
                  child: Icon(Icons.menu)),
              label: 'Menu',
              backgroundColor: Color.fromARGB(255, 16, 16, 16)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => production_house_schedules_page(),
                      )),
                  child: Icon(Icons.event_note)),
              label: 'Schedules',
              backgroundColor: Color.fromARGB(255, 16, 16, 16)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => production_house_settings_page(),
                      )),
                  child: Icon(Icons.settings)),
              label: 'Settings',
              backgroundColor: Color.fromARGB(255, 16, 16, 16)),
        ],
        currentIndex: bottomnavigation_indexnumber,
        onTap: (int index) {
          setState(() {
            bottomnavigation_indexnumber = index;
          });
        },
      ),
    );
  }
}
