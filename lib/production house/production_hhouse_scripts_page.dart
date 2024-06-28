// ignore_for_file: unused_local_variable

import 'package:cinebyte_network_application/production%20house/production_house_script_download.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class production_house_scripts_page extends StatefulWidget {
  production_house_scripts_page({super.key});

  @override
  State<production_house_scripts_page> createState() =>
      _production_house_scripts_pageState();
}

class _production_house_scripts_pageState
    extends State<production_house_scripts_page> {
  final List _scripts = ['script 1', 'script 2', 'script 3', 'script 4'];

  @override
  Widget build(BuildContext context) {
    int bottomnavigation_indexnumber = 0;

    double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: Custom_appbar_real(title: 'Scripts'),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Center(
              child: GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 234, 210, 178),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 0, 0, 0)
                            .withOpacity(0.5), // Shadow color with transparency
                        blurRadius: 5.0, // Blur radius of the shadow
                        spreadRadius:
                            2.0, // Spread radius (optional) to enlarge the shadow
                        offset: Offset(2.0,
                            4.0), // Offset the shadow in x and y directions
                      ),
                    ],
                  ),
                  width: width,
                  height: 150,
                  child: Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Script 1',
                                      style: GoogleFonts.acme(fontSize: 30),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 150),
                                      child: Text(
                                        'zoom',
                                        style: GoogleFonts.acme(
                                            color: Color(0xff2D3037),
                                            fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 150),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Icon(Icons.calendar_month),
                                    ),
                                    Text(
                                      'February 15',
                                      style: GoogleFonts.acme(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // ListTile(leading: Text('1 Hr',style: GoogleFonts.lateef(fontSize: 30),),
                                    // titl)
                                    Text(
                                      '1',
                                      style: GoogleFonts.lateef(fontSize: 40),
                                    ),
                                    Text('Hr'),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Start',
                                      style: GoogleFonts.lateef(fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      '9:30AM',
                                      style: GoogleFonts.lateef(fontSize: 25),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'End',
                                      style: GoogleFonts.lateef(fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      '10:30AM',
                                      style: GoogleFonts.lateef(
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: _scripts.length,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 10,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: GestureDetector(
      //             onTap: () => Navigator.of(context).push(MaterialPageRoute(
      //                   builder: (context) => production_house_home_page(),
      //                 )),
      //             child: Icon(Icons.home)),
      //         label: 'home',
      //         backgroundColor: Color(0xff36393F)),
      //     BottomNavigationBarItem(
      //         icon: GestureDetector(
      //             onTap: () => Navigator.of(context).push(MaterialPageRoute(
      //                   builder: (context) => production_page_menu_page(),
      //                 )),
      //             child: Icon(Icons.menu)),
      //         label: 'Menu',
      //         backgroundColor: Color(0xff36393F)),
      //     BottomNavigationBarItem(
      //         icon: GestureDetector(
      //             onTap: () => Navigator.of(context).push(MaterialPageRoute(
      //                   builder: (context) => production_house_schedules_page(),
      //                 )),
      //             child: Icon(Icons.event_note)),
      //         label: 'Schedules',
      //         backgroundColor: Color(0xff36393F)),
      //     BottomNavigationBarItem(
      //         icon: GestureDetector(
      //             onTap: () => Navigator.of(context).push(MaterialPageRoute(
      //                   builder: (context) => production_house_settings_page(),
      //                 )),
      //             child: Icon(Icons.settings)),
      //         label: 'Settings',
      //         backgroundColor: Color(0xff36393F)),
      //   ],
      //   currentIndex: bottomnavigation_indexnumber,
      //   onTap: (int index) {
      //     setState(() {
      //       bottomnavigation_indexnumber = index;
      //     });
      //   },
      // ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 234, 210, 178),
        child: Icon(Icons.add),
      ),
    );
  }
}
