import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class help_center_page extends StatelessWidget {
  const help_center_page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: Custom_appbar_real(title: 'Help center'),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Hello, how can we help you?',
              style: GoogleFonts.fugazOne(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  hintText: 'Search our knowledge base',
                  hintStyle:
                      GoogleFonts.fugazOne(color: Colors.grey, fontSize: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(),
                  )),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Or choose a category to find what you’re looking for..',
            style: GoogleFonts.fugazOne(color: Colors.white, fontSize: 12),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(
                    Size(width, 50),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 240, 207, 166))),
              onPressed: () {},
              icon: Icon(
                Icons.directions,
                color: Color.fromARGB(255, 46, 53, 62),
              ),
              label: Text(
                'Getting started',
                style: GoogleFonts.fugazOne(
                    color: Color.fromARGB(255, 46, 53, 62)),
              )),
          SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(
                    Size(width, 50),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 240, 207, 166))),
              onPressed: () {},
              icon: Icon(
                Icons.group,
                color: Color.fromARGB(255, 46, 53, 62),
              ),
              label: Text(
                'Community',
                style: GoogleFonts.fugazOne(
                    color: Color.fromARGB(255, 46, 53, 62)),
              )),
          SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
              style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(
                    Size(width, 50),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 240, 207, 166))),
              onPressed: () {},
              icon: Icon(
                Icons.feedback,
                color: Color.fromARGB(255, 46, 53, 62),
              ),
              label: Text(
                'FAQ',
                style: GoogleFonts.fugazOne(
                    color: Color.fromARGB(255, 46, 53, 62)),
              )),
        ],
      ),
    );
  }
}
