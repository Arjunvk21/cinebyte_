import 'package:cinebyte_network_application/production%20house/production_hhouse_scripts_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_settings_page.dart';
import 'package:cinebyte_network_application/production%20house/production_house_shooting_Page.dart';
import 'package:cinebyte_network_application/user/gallery_page.dart';
import 'package:cinebyte_network_application/user/user_home_page.dart';
import 'package:cinebyte_network_application/user/user_menu_page.dart';
import 'package:cinebyte_network_application/user/user_scheduled_scripts.dart';
import 'package:cinebyte_network_application/user/user_settings.dart';
import 'package:cinebyte_network_application/user/user_shootings_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class user_schedule_page extends StatefulWidget {
  user_schedule_page({super.key});

  @override
  State<user_schedule_page> createState() =>
      _production_house_schedules_pageState();
}

class _production_house_schedules_pageState extends State<user_schedule_page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    int bottomnavigation_indexnumber = 3;

    // ignore: prefer_const_constructors
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 33, 33, 33),
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Schedules',
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
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: const Color.fromARGB(255, 33, 33, 33),
                  ),
                  child: const TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: Color.fromARGB(0, 255, 255, 255),
                      indicator: BoxDecoration(
                          color: Color.fromARGB(255, 234, 210, 178),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      labelColor: Color(0xff2D3037),
                      unselectedLabelColor: Color.fromARGB(255, 195, 192, 192),
                      tabs: [
                        App_custom_tabbar(title: 'Scripts'),
                        App_custom_tabbar(title: "Shootings"),
                      ]),
                ),
              )),
        ),
        body: TabBarView(children: [
          user_scheduled_scripts_page(),
          user_shootings_page(),
        ]),
      ),
    );
  }
}
