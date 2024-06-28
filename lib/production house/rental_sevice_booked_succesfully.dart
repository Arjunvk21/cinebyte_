import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class booked_successfully extends StatelessWidget {
  const booked_successfully({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.3;
    return Scaffold(
      appBar: Custom_appbar_real(title: 'rental services'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 234, 210, 178),
              ),
              width: width,
              height: height,
              child: Column(
                children: [
                  Text(
                    'Booked successfully',
                    style: GoogleFonts.fugazOne(
                      fontSize: 25,
                      color: Color(0xff2D3037),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.thumb_up,
                    color: Color(0xff2D3037),
                    size: 50,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
