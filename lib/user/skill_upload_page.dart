import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class skill_upload extends StatefulWidget {
  skill_upload({super.key});

  @override
  State<skill_upload> createState() => _skill_uploadState();
}

final _firstor = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
String? valuechoose;

class _skill_uploadState extends State<skill_upload> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference Users =
        FirebaseFirestore.instance.collection('users');
    // TextEditingController skillcontroller = TextEditingController();
    TextEditingController experiencecontroller = TextEditingController();

    String getSkillHint(String? value) {
      if (value == null) {
        return 'Selected skill: '; // Default hint if no selection
      } else {
        return 'Selected skill: $value'; // Updated hint with selected value
      }
    }

    void AddSkills(id) {
      final data = {
        'skill': valuechoose.toString(),
        'experience': experiencecontroller.text
      };
      Users.doc(id).update(data);
    }

    

    double width = MediaQuery.of(context).size.width * 0.97;
    double height = MediaQuery.of(context).size.height * 0.5;

    String id = _auth.currentUser!.uid;
    return Flexible(
      child: Scaffold(
        appBar:  Custom_appbar_real(title: 'Skills'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 234, 210, 178),
                  ),
                  width: width,
                  height: height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Select your skill',
                          style: GoogleFonts.fugazOne(
                              color: const Color.fromARGB(255, 33, 33, 33),
                              fontSize: 20),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 50, left: 50),
                        //   child: Container(

                        //     child: DropdownButton<String>(
                        //       isExpanded: true,
                        //       hint: Text(
                        //           'Selected skill: ',style: GoogleFonts.fugazOne( color: const Color.fromARGB(255, 33, 33, 33)),), // Explicitly type the value as String
                        //       value: valuechoose,
                        //       onChanged: (String? newValue) {
                        //         // Update to handle nullable values
                        //         setState(() {
                        //           valuechoose =
                        //               newValue; // Update the state with the selected value
                        //         });
                        //       },
                        //       // items: listitems.map((valueitem) {
                        //       //   return DropdownMenuItem<String>(
                        //       //     // Explicitly type the value as String
                        //       //     value: valueitem
                        //       //         as String, // Cast to String, but ensure safety
                        //       //     child: Text(valueitem),
                        //       //   );
                        //       // }).toList(),
                        //       items: [
                        //         DropdownMenuItem(child: Text('Acting'),value: 'act',),
                        //         DropdownMenuItem(child: Text('Direction'),value: 'Direction',),
                        //         DropdownMenuItem(child: Text('Edit'),value: 'Edit',),
                        //         DropdownMenuItem(child: Text('Dop'),value: 'DOp',)
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            hint: Text(
                              getSkillHint(valuechoose),
                              style: GoogleFonts.fugazOne(
                                  color: const Color.fromARGB(255, 33, 33, 33)),
                            ),

                            items: [
                              // List of dropdown options (uncommented)
                              DropdownMenuItem(
                                value: 'Acting',
                                child: Text(
                                  'Acting',
                                  style: GoogleFonts.fugazOne(),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Direction',
                                child: Text(
                                  'Direction',
                                  style: GoogleFonts.fugazOne(),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Editing',
                                child: Text(
                                  'Editing',
                                  style: GoogleFonts.fugazOne(),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Cinematography',
                                child: Text(
                                  'Cinematography',
                                  style: GoogleFonts.fugazOne(),
                                ),
                              )
                            ],
                            value: valuechoose, // The currently selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                valuechoose =
                                    newValue!; // Update state with the selected value
                              });
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: TextFormField(style: GoogleFonts.fugazOne(),
                            controller: experiencecontroller,
                            decoration: InputDecoration(
                                hintText: 'Experience level',
                                hintStyle: GoogleFonts.fugazOne(
                                  color: const Color.fromARGB(255, 33, 33, 33),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                            height: 40,
                            width: 120,
                            child: ElevatedButton(
                              onPressed: () {
                                AddSkills(id);
                                Navigator.pop(context);
                              },
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 33, 33, 33),
                              )),
                              child: Text(
                                'Submit',
                                style:
                                    GoogleFonts.fugazOne(color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
