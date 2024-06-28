import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class feedback_submitted_successfully_page extends StatelessWidget {
  const feedback_submitted_successfully_page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: Custom_appbar_real(title: 'Feedback'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Submitted Successfully',
                      style: GoogleFonts.fugazOne(
                          color: Color(0xff2D3037), fontSize: 20),
                    ),
                  ),
                  Center(
                    child: Icon(size: 40,
                      Icons.thumb_up,
                      color: Color(0xff2D3037),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
