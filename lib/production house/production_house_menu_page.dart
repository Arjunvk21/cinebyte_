import 'package:cinebyte_network_application/production%20house/groups_view_page.dart';
import 'package:cinebyte_network_application/production%20house/production_hhouse_scripts_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_castings_home_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_home_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_schedules_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_settings_page.dart';
import 'package:cinebyte_network_application/production%20house/rental_services_home_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class production_page_menu_page extends StatefulWidget {
  const production_page_menu_page({super.key});

  @override
  State<production_page_menu_page> createState() =>
      _production_page_menu_pageState();
}

class _production_page_menu_pageState extends State<production_page_menu_page> {
  int bottomnavigation_indexnumber = 1;

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(60),
            child: TextFormField(
              style: GoogleFonts.fugazOne(color: Colors.white),
              decoration: InputDecoration(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => production_house_scripts_page(),
                  )),
                  child: Container(
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: GestureDetector(
                    // onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => Networking(),
                    // )),
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
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            '  Rental \nservices',
                            style: GoogleFonts.fugazOne(
                                color: Color(0xff2D3037), fontSize: 17),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
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
