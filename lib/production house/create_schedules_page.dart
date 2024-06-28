import 'package:cinebyte_network_application/firebase/meetingservice.dart';
import 'package:cinebyte_network_application/model/meetingsmodel.dart';
import 'package:cinebyte_network_application/production%20house/meeting_scheduled.dart';
import 'package:cinebyte_network_application/production%20house/production_house_scripts_page.dart';
import 'package:cinebyte_network_application/user/bottomnav.dart';
import 'package:cinebyte_network_application/user/user_menu_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class create_schedules_page extends StatefulWidget {
  final DocumentSnapshot? username;
  final DocumentSnapshot? scriptdata;
  create_schedules_page({super.key, this.username, this.scriptdata});

  @override
  State<create_schedules_page> createState() => _create_schedules_pageState();
}

class _create_schedules_pageState extends State<create_schedules_page> {
  final GlobalKey<FormState> _meetingKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController date1Controller = TextEditingController();
  final TextEditingController date2Controller = TextEditingController();
  final TextEditingController date3Controller = TextEditingController();
  final TextEditingController time1Controller = TextEditingController();
  final TextEditingController time2Controller = TextEditingController();
  final TextEditingController time3Controller = TextEditingController();
  String _selectedMeetingType = 'Virtual Room';

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool isVirtualRoomSelected = false;
  bool isInPersonSelected = false;

  void _onMeetingTypeSelected(String meetingType) {
    setState(() {
      _selectedMeetingType = meetingType;
    });
  }

  // void _onButton1Pressed() {
  //   setState(() {
  //     _button1Enabled = false;
  //     _button2Enabled = true;
  //   });
  // }

  // void _onMeetingTypeSelected(String meetingType) {
  //   setState(() {
  //     isVirtualRoomSelected = meetingType == 'Virtual Room';
  //     isInPersonSelected = meetingType == 'In-person';
  //   });
  // }
  // void _onMeetingTypeSelected(String meetingType) {
  //   setState(() {
  //     if (meetingType == 'Virtual Room') {
  //       isVirtualRoomSelected = !isVirtualRoomSelected;
  //     } else if (meetingType == 'In-person') {
  //       isInPersonSelected = !isInPersonSelected;
  //     }
  //   });
  // }
  // void _onButton2Pressed() {
  //   setState(() {
  //     _button1Enabled = true;
  //     _button2Enabled = false;
  //   });
  // }

  Future<void> _showDatePicker(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // controller.text = "${picked.toLocal()}".split(' ')[0];
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _showTimePicker(TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        controller.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
      appBar:  Custom_appbar_real(title: 'Create Schedules'),
      body: Form(
        key: _meetingKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 30),
                    child: Text('Discuss with ${widget.username?['name']}',
                        style: GoogleFonts.fugazOne(
                          color: const Color.fromARGB(255, 234, 210, 178),
                        )),
                  ),
                ],
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 34, 37, 45),
                  ),
                  width: width,
                  height: height,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 25, right: 25),
                    child: Column(
                      children: [
                        TextField(
                          style: GoogleFonts.fugazOne(
                            color: const Color.fromARGB(255, 234, 210, 178),
                          ),
                          controller: descriptionController,
                          keyboardType: TextInputType.multiline,
                          minLines: 3,
                          maxLines: 5,
                          decoration: InputDecoration(
                            label: Text(
                              'Description',
                              style: GoogleFonts.fugazOne(
                                color: const Color.fromARGB(255, 234, 210, 178),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.description,
                              color: const Color.fromARGB(255, 234, 210, 178),
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text('Add Available Dates',
                                  style: GoogleFonts.fugazOne(
                                    color: const Color.fromARGB(
                                        255, 234, 210, 178),
                                  )),
                            ),
                          ],
                        ),
                        const Divider(thickness: 1, color: Colors.white),
                        const SizedBox(height: 20),
                        buildDateTimeField(date1Controller, time1Controller),
                        buildDateTimeField(date2Controller, time2Controller),
                        buildDateTimeField(date3Controller, time3Controller),
                        const SizedBox(height: 20),
                        Text(
                          'Meeting type',
                          style: GoogleFonts.fugazOne(color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MeetingTypeButton(
                              meetingType: 'Virtual Room',
                              isSelected:
                                  _selectedMeetingType == 'Virtual Room',
                              onTap: () =>
                                  _onMeetingTypeSelected('Virtual Room'),
                            ),
                            const SizedBox(width: 10),
                            MeetingTypeButton(
                              meetingType: 'In-person',
                              isSelected: _selectedMeetingType == 'In-person',
                              onTap: () => _onMeetingTypeSelected('In-person'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 234, 210, 178),
                            minimumSize: const Size(200, 40),
                          ),
                          onPressed: () {
                            if (_meetingKey.currentState!.validate()) {
                              addMeeting();
                            }
                          },
                          child: Text(
                            "Schedule",
                            style: GoogleFonts.fugazOne(
                              color: const Color.fromARGB(255, 46, 53, 62),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDateTimeField(TextEditingController dateController,
      TextEditingController timeController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: TextFormField(
            style: GoogleFonts.fugazOne(
              color: const Color.fromARGB(255, 234, 210, 178),
            ),
            controller: dateController,
            decoration: InputDecoration(
              hintText: 'Select date',
              suffixIcon: IconButton(
                onPressed: () => _showDatePicker(dateController),
                icon: const Icon(
                  Icons.calendar_month,
                  color: const Color.fromARGB(255, 234, 210, 178),
                ),
              ),
              suffixIconColor: const Color.fromARGB(255, 161, 160, 160),
              hintStyle: GoogleFonts.fugazOne(
                color: const Color.fromARGB(255, 161, 160, 160),
              ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: TextFormField(
            style: GoogleFonts.fugazOne(
              color: const Color.fromARGB(255, 234, 210, 178),
            ),
            controller: timeController,
            decoration: InputDecoration(
              hintText: 'Select time',
              suffixIcon: IconButton(
                onPressed: () => _showTimePicker(timeController),
                icon: const Icon(
                  Icons.schedule,
                  color: const Color.fromARGB(255, 234, 210, 178),
                ),
              ),
              suffixIconColor: const Color.fromARGB(255, 161, 160, 160),
              hintStyle: GoogleFonts.fugazOne(
                color: const Color.fromARGB(255, 161, 160, 160),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void addMeeting() {
    try {
      String availableDate1 = date1Controller.text;
      TimeOfDay availableTime1 = parseTime(time1Controller.text);
      String availableDate2 = date2Controller.text;
      TimeOfDay availableTime2 = parseTime(time2Controller.text);
      String availableDate3 = date3Controller.text;
      TimeOfDay availableTime3 = parseTime(time3Controller.text);
      var meetingId = Uuid().v1();
      String senderId = FirebaseAuth.instance.currentUser!.uid;
      meetingModel meeting = meetingModel(
          scriptName: widget.scriptdata?['scriptname'],
          meetingId: meetingId,
          senderUserId: senderId,
          receiverUserId: widget.username?['userid'],
          meetingDescription: descriptionController.text,
          availableDates1: availableDate1,
          availableDates2: availableDate2,
          availableDates3: availableDate3,
          availableTime1: availableTime1,
          availableTime2: availableTime2,
          availableTime3: availableTime3,
          meetingType: _selectedMeetingType,
          meetingStatus: 'Pending',
          confirmedDate: '');
      MeetingService meetingService = MeetingService();
      meetingService.createmeetings(meeting);

      Fluttertoast.showToast(
        msg: "Meeting Scheduled",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const custombottomnavigationbar(),
      ));
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to Schedule Meeting..",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  TimeOfDay parseTime(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }
}

class MeetingTypeButton extends StatefulWidget {
  final String meetingType;
  final bool isSelected;
  final VoidCallback onTap;

  const MeetingTypeButton({
    required this.meetingType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<MeetingTypeButton> createState() => _MeetingTypeButtonState();
}

class _MeetingTypeButtonState extends State<MeetingTypeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? const Color.fromARGB(255, 234, 210, 178)
              : Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          widget.meetingType,
          style: GoogleFonts.fugazOne(
            color: widget.isSelected
                ? const Color.fromARGB(255, 46, 53, 62)
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
