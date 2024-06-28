import 'package:cinebyte_network_application/production%20house/production_house_settings_page.dart';
import 'package:cinebyte_network_application/user/gallery_page.dart';
import 'package:cinebyte_network_application/user/sinlge_post_view_page.dart';
import 'package:cinebyte_network_application/user/user_home_page.dart';
import 'package:cinebyte_network_application/user/user_menu_page.dart';
import 'package:cinebyte_network_application/user/user_schedules_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class user_connect_page extends StatefulWidget {
  const user_connect_page({super.key});

  @override
  State<user_connect_page> createState() => _user_connect_pageState();
}

class _user_connect_pageState extends State<user_connect_page> {
  @override
  Widget build(BuildContext context) {
    final List postslist = [1, 2, 34, 5, 6, 4, 3, 3];
    double width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      appBar: Custom_appbar_real(title: 'User'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 234, 210, 178),
              ),
              width: width,
              height: 170,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 20),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPzVgo3yqoEmk3EEo2WPIDK7W5n4Mk_vinDYtsDKmfGg&s'),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'Prithviraj productions',
                            style: GoogleFonts.acme(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'prithvirajproduction@gmail.com',
                            style: GoogleFonts.acme(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 130),
                          child: Text(
                            'Actor',
                            style: GoogleFonts.acme(fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 105),
                          child: Text(
                            'Experience',
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
          ),
          SizedBox(
            height: 20,
          ),
          App_Custom_button(
              textcolor: Color(0xff36393F),
              hsize: 30,
              fontsize: 15,
              onPressed: () {},
              wsize: 70,
              text: 'Connect'),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => single_post_view_page()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 4, right: 4),
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        'images/aavesham.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              itemCount: postslist.length,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: [
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const user_home_page(),
                      )),
                  child: const Icon(Icons.home)),
              label: 'home',
              backgroundColor: const Color(0xff36393F)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const user_page_menu_page(),
                      )),
                  child: const Icon(Icons.menu)),
              label: 'Menu',
              backgroundColor: const Color(0xff36393F)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const gallery_page(),
                      )),
                  child: const Icon(Icons.add_box_outlined)),
              label: 'Gallery',
              backgroundColor: const Color(0xff36393F)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => user_schedule_page(),
                      )),
                  child: const Icon(Icons.event_note)),
              label: 'Schedules',
              backgroundColor: const Color(0xff36393F)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const production_house_settings_page(),
                      )),
                  child: const Icon(Icons.settings)),
              label: 'Settings',
              backgroundColor: const Color(0xff36393F)),
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
