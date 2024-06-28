import 'package:cinebyte_network_application/user/course_details.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class course_clicked_page extends StatefulWidget {
  const course_clicked_page({super.key});

  @override
  State<course_clicked_page> createState() => _course_clicked_pageState();
}

// ignore: camel_case_types
class _course_clicked_pageState extends State<course_clicked_page> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 33, 33, 33),
            title: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Course',
                style: GoogleFonts.fugazOne(color: Colors.white),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 40, top: 15),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_rounded)),
              ),
            ],
            iconTheme: const IconThemeData(color: Colors.white),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: const Color.fromARGB(255, 33, 33, 33),
                    ),
                    child: const TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Color.fromARGB(0, 255, 255, 255),
                        indicator: BoxDecoration(
                            color: Color.fromARGB(255, 234, 210, 178),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        labelColor: Color(0xff2D3037),
                        unselectedLabelColor:
                            Color.fromARGB(255, 195, 192, 192),
                        tabs: [
                          App_custom_tabbar(title: 'Lessons'),
                          App_custom_tabbar(title: "About"),
                        ]),
                  ),
                )),
          ),
          body: const Center(
            child: TabBarView(children: [
              tablessons(),
              course_details_page(),
            ]),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class tablessons extends StatelessWidget {
  const tablessons({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 220,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    'images/actingclass.jpg',
                  ),
                ),
                Positioned(top: 100,left: 110,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 234, 210, 178),
                        )),
                        onPressed: () {},
                        child:  Text('Enroll now',style: GoogleFonts.fugazOne(color:Color(0xff2D3037)),)))
              ],
            ),
            Expanded(
              child: SizedBox(
                width: width,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: ListTile(
                        titleTextStyle: GoogleFonts.fugazOne(
                            color: const Color(0xff2D3037)),
                        leadingAndTrailingTextStyle: GoogleFonts.fugazOne(),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(20))),
                        tileColor: const Color.fromARGB(255, 234, 210, 178),
                        leading: const Text('1'),
                        title: const Text('Lessons'),
                        trailing: const Icon(Icons.play_circle_outline),
                      ),
                    );
                  },
                  itemCount: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
