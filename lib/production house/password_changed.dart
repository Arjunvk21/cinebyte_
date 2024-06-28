import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Password_changed_page extends StatelessWidget {
  const Password_changed_page({super.key});

  @override
  Widget build(BuildContext context) {
            double width = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Text('Password Changed',style: App_custom_heading_textStyle.style),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 220, 206, 143)),
                          minimumSize: MaterialStatePropertyAll(
                            Size(width, 50),
                          )),
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => register_account()));
                      },
                      child: Text(
                        "Back to login page",
                        style: GoogleFonts.fugazOne(
                            color: Color.fromARGB(255, 46, 53, 62),
                            fontSize: 18),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}