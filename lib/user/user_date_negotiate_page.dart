import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class user_date_negotiate_page extends StatefulWidget {
  const user_date_negotiate_page({super.key});

  @override
  State<user_date_negotiate_page> createState() =>
      _create_schedules_pageState();
}

class _create_schedules_pageState extends State<user_date_negotiate_page> {
  @override
  Widget build(BuildContext context) {
    DateTime _datetime = DateTime.now();
    TimeOfDay _selectedtime = TimeOfDay.now();

    void _showdatepicker() {
      showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(2050))
          .then((value) => setState(() {
                _datetime = value!;
              }));
    }

    List<bool> isSelected = [false, false];
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
      appBar: Custom_appbar_real(title: 'Create schedules'),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: Text(
                  'Discuss with Alex D paul',
                  style:
                      GoogleFonts.fugazOne(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 34, 37, 45),
              ),
              width: width,
              height: height,
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.multiline,
                      minLines: 3, // This sets the initial number of lines
                      maxLines:
                          5, // This allows up to 5 lines (same as previous example)
                      decoration: InputDecoration(
                        label: Text(
                          'Enter your reason',
                          style: GoogleFonts.fugazOne(),
                        ),
                        prefixIcon: Icon(Icons.description),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add available dates',
                          style: GoogleFonts.fugazOne(
                              color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(
                          width: 120,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText:
                                    '${_datetime.day}-${_datetime.month}-${_datetime.year}',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      _showdatepicker();
                                    },
                                    icon: Icon(Icons.calendar_month)),
                                suffixIconColor:
                                    const Color.fromARGB(255, 161, 160, 160),
                                hintStyle: GoogleFonts.fugazOne(
                                    color: const Color.fromARGB(
                                        255, 161, 160, 160))),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText:
                                    '${_selectedtime.hour}-${_selectedtime.minute}',
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      final TimeOfDay? timeofday =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: _selectedtime,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);
                                      if (timeofday != null) {
                                        setState(() {
                                          _selectedtime = timeofday;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.schedule)),
                                suffixIconColor:
                                    const Color.fromARGB(255, 161, 160, 160),
                                hintStyle: GoogleFonts.fugazOne(
                                    color: const Color.fromARGB(
                                        255, 161, 160, 160))),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText:
                                    '${_datetime.day}-${_datetime.month}-${_datetime.year}',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      _showdatepicker();
                                    },
                                    icon: Icon(Icons.calendar_month)),
                                suffixIconColor:
                                    const Color.fromARGB(255, 161, 160, 160),
                                hintStyle: GoogleFonts.fugazOne(
                                    color: const Color.fromARGB(
                                        255, 161, 160, 160))),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText:
                                    '${_selectedtime.hour}-${_selectedtime.minute}',
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      final TimeOfDay? timeofday =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: _selectedtime,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);
                                      if (timeofday != null) {
                                        setState(() {
                                          _selectedtime = timeofday;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.schedule)),
                                suffixIconColor:
                                    const Color.fromARGB(255, 161, 160, 160),
                                hintStyle: GoogleFonts.fugazOne(
                                    color: const Color.fromARGB(
                                        255, 161, 160, 160))),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText:
                                    '${_datetime.day}-${_datetime.month}-${_datetime.year}',
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      _showdatepicker();
                                    },
                                    icon: Icon(Icons.calendar_month)),
                                // suffixIcon: Icon(Icons.calendar_month),
                                suffixIconColor:
                                    const Color.fromARGB(255, 161, 160, 160),
                                hintStyle: GoogleFonts.fugazOne(
                                    color: const Color.fromARGB(
                                        255, 161, 160, 160))),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText:
                                    '${_selectedtime.hour}-${_selectedtime.minute}',
                                suffixIcon: IconButton(
                                    onPressed: () async {
                                      final TimeOfDay? timeofday =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: _selectedtime,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);
                                      if (timeofday != null) {
                                        setState(() {
                                          _selectedtime = timeofday;
                                        });
                                      }
                                    },
                                    icon: Icon(Icons.schedule)),
                                suffixIconColor:
                                    const Color.fromARGB(255, 161, 160, 160),
                                hintStyle: GoogleFonts.fugazOne(
                                    color: const Color.fromARGB(
                                        255, 161, 160, 160))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 220, 206, 143)),
                                minimumSize: MaterialStatePropertyAll(
                                  Size(200, 40),
                                )),
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => register_account()));
                            },
                            child: Text(
                              "Negotiate",
                              style: GoogleFonts.fugazOne(
                                  color: Color.fromARGB(255, 46, 53, 62),
                                  fontSize: 14),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
