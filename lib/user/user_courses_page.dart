import 'package:cinebyte_network_application/user/course_clicked_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class courses_page extends StatelessWidget {
  final List courselist = ['c1', 'c2', 'c3', 'c4'];
  courses_page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: Custom_appbar_real(title: 'Courses'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
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
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Center(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const course_clicked_page(),));
                      },
                      child: Container(height: 220,width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'images/actingclass.jpg',
                        ),
                      )),
                );
              },
              itemCount: courselist.length,
            ),
          ),
        ],
      ),
    );
  }
}
