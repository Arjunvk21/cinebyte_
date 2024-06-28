import 'package:cinebyte_network_application/user/bottomnav.dart';
import 'package:cinebyte_network_application/user/user_date_negotiate_page.dart';
import 'package:cinebyte_network_application/user/user_meeting_pick_date_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class user_scripts_approve_or_datenegotiate_page extends StatefulWidget {
  final DocumentSnapshot? meetingDetails;
  final DocumentSnapshot? script;

  const user_scripts_approve_or_datenegotiate_page(
      {super.key, this.meetingDetails, this.script});

  @override
  State<user_scripts_approve_or_datenegotiate_page> createState() =>
      _user_scripts_approve_or_datenegotiate_pageState();
}

class _user_scripts_approve_or_datenegotiate_pageState
    extends State<user_scripts_approve_or_datenegotiate_page> {
  final GlobalKey<FormState> _meetapprovekey = GlobalKey<FormState>();
  Map<String, dynamic>? senderDetails;
  bool _isLoading = true;
  // DateTime? availableDates1;
  // TimeOfDay? availableTime1;
  // DateTime? availableDates2;
  // TimeOfDay? availableTime2;
  // DateTime? availableDates3;
  // TimeOfDay? availableTime3;
  List<Map<String, dynamic>> meetingDatesTimes = [];
  String? selectedDatetime;
  final List listitems = ['aaa', 'bbbb', 'vvvvv'];

  @override
  void initState() {
    super.initState();
    fetchSenderDetails();
    extractMeetingDates(widget.meetingDetails!);
  }

  Future<void> fetchSenderDetails() async {
    if (widget.meetingDetails == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    String senderId = widget.meetingDetails!['senderUserId'];
    if (senderId == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    try {
      DocumentSnapshot senderSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(senderId)
          .get();

      if (senderSnapshot.exists) {
        setState(() {
          senderDetails = senderSnapshot.data() as Map<String, dynamic>?;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching sender details: $e');
    }
  }

  List<String> meetingDates = [];

  void extractMeetingDates(DocumentSnapshot meetingDetails) {
    if (meetingDetails.exists) {
      try {
        // Get document data as a map
        var data = meetingDetails.data() as Map<String, dynamic>;

        // Check if each field exists and is of the correct type
        if (data.containsKey('availableDates1') &&
            data['availableDates1'] is String &&
            data.containsKey('availableDates2') &&
            data['availableDates2'] is String &&
            data.containsKey('availableDates3') &&
            data['availableDates3'] is String) {
          // Extract the fields
          String date1 = data['availableDates1'];
          String date2 = data['availableDates2'];
          String date3 = data['availableDates3'];

          // Populate the meetingDates list
          meetingDates = [date1, date2, date3];
        } else {
          throw Exception("Invalid field types in meetingDetails");
        }
      } catch (e) {
        print("Error extracting meeting dates: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // String? values;
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
      appBar:  Custom_appbar_real(title: 'Scripts/Synopsys'),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : senderDetails == null
              ? Center(
                  child: Text(
                    'Sender details not found',
                    style: GoogleFonts.fugazOne(color: Colors.white),
                  ),
                )
              : Form(
                  key: _meetapprovekey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 234, 210, 178),
                          ),
                          width: width,
                          height: height,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(senderDetails![
                                          'image'] ??
                                      'https://www.shutterstock.com/image-vector/user-profile-icon-vector-avatar-600nw-2247726673.jpg'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  senderDetails!['name'] ?? 'Unknown Name',
                                  style: GoogleFonts.acme(
                                    color: const Color(0xff2D3037),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 90, right: 90),
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xff36393F),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  widget.script?['scriptName'],
                                  style: GoogleFonts.acme(
                                    color: const Color(0xff2D3037),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 90, right: 90),
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xff36393F),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Text(
                                      widget.meetingDetails?[
                                          'meetingDescription'],
                                      style: GoogleFonts.lateef(
                                        color: const Color(0xff2D3037),
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      'Meeting Type : ${widget.meetingDetails?['meetingType']}',
                                      style: GoogleFonts.lateef(
                                        color: const Color(0xff2D3037),
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(60),
                                child: DropdownButtonFormField(
                                  isExpanded: true,
                                  icon: const Icon(
                                      Icons.arrow_drop_down_circle_outlined),
                                  hint: Text(
                                    'Pick a date',
                                    style: GoogleFonts.fugazOne(
                                      color:
                                          const Color.fromARGB(255, 70, 75, 86),
                                      fontSize: 20,
                                    ),
                                  ),
                                  value: selectedDatetime,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedDatetime = newValue as String?;
                                    });
                                  },
                                  items: meetingDates.map((date) {
                                    return DropdownMenuItem(
                                      value: date,
                                      child: Text(date),
                                    );
                                  }).toList(),
                                ),
                              ),

                              // pickdate
                              // Padding(
                              //   padding: const EdgeInsets.all(60),
                              //   child: DropdownButtonFormField(
                              //     isExpanded: true,
                              //     icon: const Icon(
                              //         Icons.arrow_drop_down_circle_outlined),
                              //     hint: Text(
                              //       'Pick a date',
                              //       style: GoogleFonts.fugazOne(
                              //           color: const Color.fromARGB(
                              //               255, 70, 75, 86),
                              //           fontSize: 20),
                              //     ),
                              //     value: selectedDatetime,
                              //     onChanged: (newvalue) {
                              //       setState(() {
                              //         selectedDatetime =
                              //             newvalue as Map<String, dynamic>?;
                              //       });
                              //     },
                              //     items: listitems.map((valueitem) {
                              //       return DropdownMenuItem(
                              //         value: valueitem,
                              //         child: Text(valueitem),
                              //       );
                              //     }).toList(),
                              //   ),
                              // ),
                              //pickdate
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Material(
                                    elevation: 10,
                                    color: Colors.transparent,
                                    clipBehavior: Clip.hardEdge,
                                    borderRadius: BorderRadius.circular(20),
                                    child: ElevatedButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color(0xff2D3037)),
                                            minimumSize:
                                                MaterialStatePropertyAll(
                                              Size(200, 50),
                                            )),
                                        onPressed: () {
                                          try {
                                            if (_meetapprovekey.currentState!
                                                .validate()) {
                                              FirebaseFirestore.instance
                                                  .collection("meetings")
                                                  .doc(widget.meetingDetails![
                                                      "meetingId"])
                                                  .update({
                                                "meetingStatus": "Accepted",
                                                "confirmedDate":
                                                    selectedDatetime
                                              });
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                      builder: (context) =>
                                                          custombottomnavigationbar()))
                                                  .then((value) =>
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            "Meeting Scheduled",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.CENTER,
                                                        timeInSecForIosWeb: 1,
                                                        backgroundColor:
                                                            Colors.green,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0,
                                                      ));
                                            }
                                          } on FirebaseAuthException {
                                            Fluttertoast.showToast(
                                              msg: "Something went wrong",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                          }
                                        },
                                        child: Text(
                                          "Approve",
                                          style: GoogleFonts.fugazOne(
                                              color: Colors.white,
                                              fontSize: 14),
                                        )),
                                  ),
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
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color(0xff2D3037)),
                                            minimumSize:
                                                MaterialStatePropertyAll(
                                              Size(200, 50),
                                            )),
                                        onPressed: () async {
                                          try {
                                            FirebaseFirestore.instance
                                                .collection("meetings")
                                                .doc(widget.meetingDetails![
                                                    "meetingId"])
                                                .update({
                                              "meetingStatus": "Reject"
                                            });
                                            await FirebaseFirestore.instance
                                                .collection("meetings")
                                                .doc(widget.meetingDetails![
                                                    "meetingId"])
                                                .delete()
                                                .then((value) {
                                              Fluttertoast.showToast(
                                                msg: "Meeting Rejected",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0,
                                              );
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    custombottomnavigationbar(),
                                              ));
                                            });
                                          } on FirebaseAuthException {
                                            Fluttertoast.showToast(
                                              msg: "Something went wrong",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                          }
                                        },
                                        child: Text(
                                          "Reject",
                                          style: GoogleFonts.fugazOne(
                                              color: Colors.white,
                                              fontSize: 14),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
