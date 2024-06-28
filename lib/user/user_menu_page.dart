// ignore_for_file: prefer_const_constructors

import 'package:cinebyte_network_application/production%20house/groups_view_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_castings_home_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_scripts_page.dart';
import 'package:cinebyte_network_application/production%20house/rental_services_home_page.dart';
import 'package:cinebyte_network_application/user/user_courses_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class user_page_menu_page extends StatefulWidget {
  const user_page_menu_page({super.key});

  @override
  State<user_page_menu_page> createState() => _production_page_menu_pageState();
}

class _production_page_menu_pageState extends State<user_page_menu_page> {
  int bottomnavigation_indexnumber = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            'Menu',
            style: GoogleFonts.fugazOne(color: Colors.white),
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 40, top: 15),
        //     child: IconButton(
        //         onPressed: () {}, icon: Icon(Icons.arrow_back_rounded)),
        //   ),
        // ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: TextFormField(
                  style: GoogleFonts.fugazOne(color: maintextcolor),
                  decoration: InputDecoration(
                      fillColor: maintextcolor,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: maintextcolor,
                          )),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      hintText: 'Search',
                      hintStyle: GoogleFonts.fugazOne(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(),
                      )),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => producton_house_scripts_page(),
                      )),
                      child: Container(
                        // margin: EdgeInsets.all(70),
                        height: 130,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color.fromARGB(255, 234, 210, 178),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.description,
                                  color: Color(0xff262A31),
                                  size: 35,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Scripts',
                                  style: GoogleFonts.fugazOne(
                                      color: Color(0xff2D3037), fontSize: 17),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Networking(),
                        )),
                        child: Container(
                          // margin: EdgeInsets.all(60),
                          height: 130,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color.fromARGB(255, 234, 210, 178),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.group,
                                    color: Color(0xff262A31),
                                    size: 35,
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Networking',
                                    style: GoogleFonts.fugazOne(
                                        color: Color(0xff2D3037), fontSize: 17),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => casting_home_page(),
                    )),
                    child: Container(
                      // margin: EdgeInsets.only(
                      //   left: 70,
                      // ),
                      // margin: EdgeInsets.all(60),
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(255, 234, 210, 178),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.theater_comedy,
                                color: Color(0xff262A31),
                                size: 35,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Castings',
                                style: GoogleFonts.fugazOne(
                                    color: Color(0xff2D3037), fontSize: 17),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => rental_services_home_page(),
                    )),
                    child: Container(
                      // margin: EdgeInsets.only(
                      //   left: 70,
                      // ),
                      // margin: EdgeInsets.all(60),
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(255, 234, 210, 178),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Color(0xff262A31),
                                size: 35,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Rental Service',
                                style: GoogleFonts.fugazOne(
                                    color: Color(0xff2D3037), fontSize: 17),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => courses_page(),
                    )),
                    child: Container(
                      // margin: EdgeInsets.only(
                      //   left: 70,
                      // ),
                      margin: EdgeInsets.only(left: 40),
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(255, 234, 210, 178),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.menu_book,
                                color: Color(0xff262A31),
                                size: 35,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Courses',
                                style: GoogleFonts.fugazOne(
                                    color: Color(0xff2D3037), fontSize: 17),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
