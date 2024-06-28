import 'dart:developer';

import 'package:cinebyte_network_application/production%20house/production_house_script_download.dart';
import 'package:cinebyte_network_application/user/script_upload_page.dart';
import 'package:cinebyte_network_application/user/user_script_approve_or_datenegotiate_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class user_scheduled_scripts_page extends StatefulWidget {
  user_scheduled_scripts_page({super.key});

  @override
  State<user_scheduled_scripts_page> createState() =>
      _user_scheduled_scripts_pageState();
}

class _user_scheduled_scripts_pageState
    extends State<user_scheduled_scripts_page> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _scripts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserScheduledScripts();
  }

  Future<void> fetchUserScheduledScripts() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      try {
        QuerySnapshot snapshot1 = await _firestore
            .collection('meetings')
            .where('receiverUserId', isEqualTo: currentUser.uid)
            .get();

        QuerySnapshot snapshot2 = await _firestore
            .collection('meetings')
            .where('senderUserId', isEqualTo: currentUser.uid)
            .get();

        List<DocumentSnapshot> combinedResults = [];
        combinedResults.addAll(snapshot1.docs);
        combinedResults.addAll(snapshot2.docs);

        Map<String, DocumentSnapshot> uniqueResults = {};
        for (var doc in combinedResults) {
          uniqueResults[doc.id] = doc;
        }

        // List<Map<String, dynamic>> scripts = [];

        setState(() {
          _scripts = uniqueResults.values.toList();
          _isLoading = false;
        });
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(
          msg: "Error Fetching Scheduled Scripts: ${e.message}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _scripts.isEmpty
              ? Center(
                  child: Text(
                    'No Scheduled Scripts Found',
                    style: GoogleFonts.fugazOne(color: Colors.white),
                  ),
                )
              : ListView.builder(
                  itemCount: _scripts.length,
                  itemBuilder: (context, index) {
                    var script = _scripts[index];
                    String meetingStatus = script['meetingStatus'] ?? '';
                    String confirmedDate = script['confirmedDate'] ?? '';
                    Map<String, dynamic> availableTime1 =
                        script['availableTime1'] ?? '';
                    Color iconColor;
                    switch (meetingStatus) {
                      case 'Accepted':
                        iconColor = Colors.green;
                        break;
                      case 'Rejected':
                        iconColor = Colors.red;
                        break;
                      default:
                        iconColor = Colors.grey;
                    }

                    return Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            if (confirmedDate.isNotEmpty &&
                                meetingStatus == 'Accepted') {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor:
                                        Color.fromARGB(255, 234, 210, 178),
                                    title: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Meeting scheduled',
                                            style:
                                                GoogleFonts.acme(fontSize: 20),
                                          ),
                                          Text(
                                            'Date : $confirmedDate',
                                            style:
                                                GoogleFonts.acme(fontSize: 17),
                                          ),
                                          Text(
                                            'Time : $availableTime1',
                                            style:
                                                GoogleFonts.acme(fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      user_scripts_approve_or_datenegotiate_page(
                                    meetingDetails: script,
                                    script: script,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 234, 210, 178),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 0, 0, 0)
                                      .withOpacity(0.5),
                                  blurRadius: 5.0,
                                  spreadRadius: 2.0,
                                  offset: Offset(2.0, 4.0),
                                ),
                              ],
                            ),
                            width: width,
                            height: 150,
                            child: Center(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 10),
                                          child: SizedBox(
                                            width: 250,
                                            child: Row(
                                              children: [
                                                Text(
                                                  script['scriptName'] ?? '',
                                                  style: GoogleFonts.acme(
                                                      fontSize: 20),
                                                ),
                                                Spacer(),
                                                Icon(
                                                  Icons.check_circle,
                                                  color: iconColor,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 150),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child:
                                                    Icon(Icons.calendar_month),
                                              ),
                                              Text(
                                                script['availableDates1']
                                                    .toString(), // Placeholder, replace with actual data if available
                                                style: GoogleFonts.acme(
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '1',
                                                style: GoogleFonts.lateef(
                                                    fontSize: 40),
                                              ),
                                              Text('Hr'),
                                              SizedBox(width: 20),
                                              Text(
                                                'Start',
                                                style: GoogleFonts.lateef(
                                                    fontSize: 20),
                                              ),
                                              SizedBox(width: 6),
                                              Text(
                                                '9:30AM', // Placeholder, replace with actual data if available
                                                style: GoogleFonts.lateef(
                                                    fontSize: 25),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                'End',
                                                style: GoogleFonts.lateef(
                                                    fontSize: 20),
                                              ),
                                              SizedBox(width: 6),
                                              Text(
                                                '10:30AM', // Placeholder, replace with actual data if available
                                                style: GoogleFonts.lateef(
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => script_upload_page(),
      //     ));
      //   },
      //   backgroundColor: Color.fromARGB(255, 234, 210, 178),
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
