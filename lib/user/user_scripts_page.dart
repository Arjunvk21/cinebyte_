import 'package:cinebyte_network_application/user/script_upload_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class user_script_scripts_page extends StatelessWidget {
  final List _scripts = ['script 1', 'script 2', 'script 3', 'script 4'];
  user_script_scripts_page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Center(
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
                      offset: Offset(
                          2.0, 4.0), // Offset the shadow in x and y directions
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
                              padding: const EdgeInsets.only(left: 20, top: 10),
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
          );
        },
        itemCount: _scripts.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const script_upload_page(),
          ));
        },
        backgroundColor: Color.fromARGB(255, 234, 210, 178),
        child: Icon(Icons.add),
      ),
    );
  }
}
