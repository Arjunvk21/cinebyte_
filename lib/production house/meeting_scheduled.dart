import 'dart:async';

import 'package:cinebyte_network_application/production%20house/production_house_schedules_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class meeting_scheduled extends StatefulWidget {
  const meeting_scheduled({super.key});

  @override
  State<meeting_scheduled> createState() => _meeting_scheduledState();
}

class _meeting_scheduledState extends State<meeting_scheduled> {
void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3 ), () { Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => production_house_schedules_page(),));});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.3;
    return Scaffold(
      appBar: Custom_appbar_real(title: 'Scripts'),
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
                    'Meeting scheduled',
                    style: GoogleFonts.fugazOne(
                      fontSize: 25,
                      color: Color(0xff2D3037),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.event_available,
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
