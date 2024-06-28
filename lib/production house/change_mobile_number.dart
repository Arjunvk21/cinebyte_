import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class change_number extends StatelessWidget {
  const change_number({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: Custom_appbar_real(title: 'Change number'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Enter your number',
                  hintStyle: TextStyle(color: Colors.grey),
                  helperText: 'Your current phone number: +91 9526137554',
                  helperStyle: TextStyle(color: Colors.grey)),
              style: GoogleFonts.acme(color: Colors.grey),
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 240, 207, 166)),
                      minimumSize: MaterialStatePropertyAll(
                        Size(width, 50),
                      )),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => register_account()));
                  },
                  child: Text(
                    "Generate OTP",
                    style: GoogleFonts.fugazOne(
                        color: Color.fromARGB(255, 46, 53, 62), fontSize: 14),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
