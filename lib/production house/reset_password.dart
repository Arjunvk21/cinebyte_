import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Reset_password_page extends StatelessWidget {
  const Reset_password_page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.5;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: Text(
                    'Reset Password',
                    style: App_custom_heading_textStyle.style,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Enter a new password',
                  style: App_custom_textstyle.style,
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(
                        'Password',
                        style: GoogleFonts.fugazOne(),
                      ),
                      prefixIcon: Icon(Icons.lock_rounded),
                      suffixIcon: Icon(Icons.visibility_off_rounded)),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      label: Text(
                        'Confirm Password',
                        style: GoogleFonts.fugazOne(),
                      ),
                      prefixIcon: Icon(Icons.lock_rounded),
                      suffixIcon: Icon(Icons.visibility_off_rounded)),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(maintextcolor),
                            minimumSize: MaterialStatePropertyAll(
                              Size(width, 50),
                            )),
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => register_account()));
                        },
                        child: Text(
                          "Submit",
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
      ),
    );
  }
}
