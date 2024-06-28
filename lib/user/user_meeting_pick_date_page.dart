import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class user_date_pick_page extends StatefulWidget {
  List<Map<String,dynamic>>? pickdate;
  user_date_pick_page({super.key, this.pickdate});

  @override
  State<user_date_pick_page> createState() => _user_date_pick_pageState();
}

class _user_date_pick_pageState extends State<user_date_pick_page> {
  @override
  Widget build(BuildContext context) {
    
    final List listitems = ['list1', 'list2', 'list3', 'list4'];
    String? values;
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.7;

    return Scaffold(
      appBar: Custom_appbar_real(title: 'Date negotiate'),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 234, 210, 178),
              ),
              width: width,
              height: 350,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(60),
                    child: DropdownButton(
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down_circle_outlined),
                      hint: Text(
                        'Pick a date',
                        style: GoogleFonts.fugazOne(
                            color: Color.fromARGB(255, 70, 75, 86),
                            fontSize: 20),
                      ),
                      value: values,
                      onChanged: (newvalue) {
                        setState(() {
                          values = newvalue as String?;
                        });
                      },
                      items: listitems.map((valueitem) {
                        return DropdownMenuItem(
                          value: valueitem,
                          child: Text(valueitem),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Material(
                        elevation: 10,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Color(0xff2D3037)),
                                minimumSize: MaterialStatePropertyAll(
                                  Size(200, 50),
                                )),
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => register_account()));
                            },
                            child: Text(
                              "Submit",
                              style: GoogleFonts.fugazOne(
                                  color: Colors.white, fontSize: 14),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
