import 'package:cinebyte_network_application/production%20house/production_house_home_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_menu_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_schedules_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class production_house_settings_page extends StatefulWidget {
  const production_house_settings_page({super.key});

  @override
  State<production_house_settings_page> createState() =>
      _production_house_settings_pageState();
}

class _production_house_settings_pageState
    extends State<production_house_settings_page> {
  int bottomnavigation_indexnumber = 3;

  get production_house_user_profile_page => null;

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40, top: 15),
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_back_rounded)),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(60),
          child: TextFormField(
            style: TextStyle(color: Colors.white),
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
        Container(
          width: 480,
          height: 380,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 38, 41, 47),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0)
                    .withOpacity(0.5), // Shadow color with transparency
                blurRadius: 5.0, // Blur radius of the shadow
                spreadRadius:
                    2.0, // Spread radius (optional) to enlarge the shadow
                offset:
                    Offset(2.0, 4.0), // Offset the shadow in x and y directions
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromARGB(255, 234, 210, 178),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              production_house_schedules_page(),
                        )),
                        child: Container(
                          child: ListTile(
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
                                onPressed: () {},
                                icon: Icon(Icons.arrow_circle_right_sharp)),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      Container(
                        child: ListTile(
                          leading: Icon(Icons.logout),
                          title: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Logout',
                              style: GoogleFonts.fugazOne(
                                  color: Color.fromARGB(255, 46, 53, 62),
                                  fontSize: 18),
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_circle_right_sharp)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
