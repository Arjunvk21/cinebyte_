import 'package:cinebyte_network_application/user/gallery_page.dart';
import 'package:cinebyte_network_application/user/user_home_page.dart';
import 'package:cinebyte_network_application/user/user_menu_page.dart';
import 'package:cinebyte_network_application/user/user_schedules_page.dart';
import 'package:cinebyte_network_application/user/user_settings.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';

class custombottomnavigationbar extends StatefulWidget {
  const custombottomnavigationbar({super.key});

  @override
  State<custombottomnavigationbar> createState() =>
      _custombottomnavigationbarState();
}

// ignore: camel_case_types
class _custombottomnavigationbarState extends State<custombottomnavigationbar> {
  int _currentindex = 0;
  List<Widget> pages = [
    const user_home_page(),
    const user_page_menu_page(),
    const gallery_page(),
    user_schedule_page(),
    const user_settings_page(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[_currentindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(size: 35, color: maintextcolor),
        elevation: 10,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
              backgroundColor: Color.fromARGB(255, 16, 16, 16)),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
              backgroundColor: Color.fromARGB(255, 16, 16, 16)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Gallery',
              backgroundColor: Color.fromARGB(255, 16, 16, 16)),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_note),
              label: 'Schedules',
              backgroundColor: Color.fromARGB(255, 16, 16, 16)),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Color.fromARGB(255, 16, 16, 16)),
        ],
        currentIndex: _currentindex,
        onTap: (int index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
