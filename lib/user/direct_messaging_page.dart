import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dm_page extends StatelessWidget {
  const dm_page({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    double height = MediaQuery.of(context).size.height * 0.8;

    return Scaffold(
      appBar: Custom_appbar_real(title: 'Chat'),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: 60,
                color: Color(0xffEBC9A9),
                child: Center(
                    child: ListTile(
                  leading: CircleAvatar(
                    child: Image.asset(''),
                  ),
                  title: Text(
                    'User',
                    style: GoogleFonts.fugazOne(
                        color: Color(0xff2D3037), fontSize: 17),
                  ),
                )),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          color: Color(0xff2D3037),
          child: Column(
            children: [
              Container(
                height: 50,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 234, 210, 178)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.photo_camera,
                        size: 30,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.send,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                )),
              ),
            ],
          )),
    );
  }
}
