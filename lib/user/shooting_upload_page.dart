import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class shooting_upload_page extends StatefulWidget {
  const shooting_upload_page({super.key});

  @override
  State<shooting_upload_page> createState() => _shooting_upload_pageState();
}

class _shooting_upload_pageState extends State<shooting_upload_page> {
  @override
  Widget build(BuildContext context) {
    final List options = ['option1', 'option2'];
    String currentoption = options[0];
    double width = MediaQuery.of(context).size.width * 0.97;
    double height = MediaQuery.of(context).size.height * 0.7;
    return Scaffold(
      appBar: Custom_appbar_real(title: 'Shooting upload'),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
              child: App_Custom_button(
                  textcolor: Color(0xff36393F),
                  hsize: 30,
                  fontsize: 15,
                  onPressed: () {},
                  wsize: 70,
                  text: 'Upload'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color.fromARGB(255, 234, 210, 178),
            ),
            width: width,
            height: height,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50, top: 50),
                      child: Text(
                        'Status',
                        style: GoogleFonts.fugazOne(
                            color: Color(0xff36393F), fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: RadioListTile(
                    title: Text('Shoot in progress',style: GoogleFonts.fugazOne(color: Color(0xff36393F), fontSize: 18),),
                      value: options[0],
                      groupValue: currentoption,
                      onChanged: (value) {
                        setState(() {
                          currentoption = value.toString();
                        });
                      }),
                ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: RadioListTile(
                        title: Text('Completed',style: GoogleFonts.fugazOne(color: Color(0xff36393F), fontSize: 18),),
                      value: options[1],
                      groupValue: currentoption,
                      onChanged: (value) {
                        setState(() {
                          currentoption = value.toString();
                        });
                      }),
                    ),


                SizedBox(
                  height: 20,
                ),
                // Image.asset('images/upload icon.png')
                Icon(
                  Icons.cloud_upload,
                  color: Color(0xff36393F),
                  size: 100,
                ),
                OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Choose a file',
                      style: GoogleFonts.fugazOne(color: Color(0xff36393F)),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
