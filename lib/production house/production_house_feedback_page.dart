
import 'package:cinebyte_network_application/firebase/feedback.dart';
import 'package:cinebyte_network_application/model/feedback_form_model.dart';
import 'package:cinebyte_network_application/user/user_home_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class production_house_feedback_page extends StatefulWidget {
  const production_house_feedback_page({super.key});

  @override
  State<production_house_feedback_page> createState() =>
      _production_house_feedback_pageState();
}

class _production_house_feedback_pageState
    extends State<production_house_feedback_page> {
  final TextEditingController feedbackEmailController = TextEditingController();
  final TextEditingController feedbackDescriptionController =
      TextEditingController();
  final GlobalKey<FormState> _feedbackKey = GlobalKey<FormState>();

  @override
  void dispose() {
    feedbackEmailController.dispose();
    feedbackDescriptionController.dispose();
    super.dispose();
  }
  // @override
  // void dispose() {
  //   feedbackEmailController.dispose();
  //   feedbackDescriptionController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    final _firestore = FirebaseFirestore.instance;
    final _auth = FirebaseAuth.instance;
    String id = _auth.currentUser!.uid;

    return Scaffold(
      appBar:  Custom_appbar_real(title: 'Feedback'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: _firestore.collection('users').doc(id).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  DocumentSnapshot data = snapshot.data!;
                  feedbackEmailController.text = data['email'] ?? '';
                  return Form(
                    key: _feedbackKey,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 480,
                          height: 430,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.5),
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                                offset: const Offset(2.0, 4.0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(50),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: feedbackEmailController,
                                  style: GoogleFonts.fugazOne(color: textcolor),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    // label: Text(
                                    //   '${data['email']}',
                                    //   style: GoogleFonts.fugazOne(
                                    //       color: Colors.white),
                                    // ),
                                    prefixIcon: const Icon(Icons.email,
                                        color: Colors.white),
                                  ),
                                ),
                                TextFormField(
                                  controller: feedbackDescriptionController,
                                  style: GoogleFonts.fugazOne(color: textcolor),
                                  keyboardType: TextInputType.multiline,
                                  minLines: 3,
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    label: Text(
                                      'Type your queries',
                                      style: GoogleFonts.fugazOne(
                                          color: Colors.white),
                                    ),
                                    prefixIcon: const Icon(Icons.feedback,
                                        color: Colors.white),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your feedback';
                                    }
                                    return null;
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              const MaterialStatePropertyAll(
                                                  Color.fromARGB(
                                                      255, 234, 210, 178)),
                                          minimumSize: MaterialStatePropertyAll(
                                            Size(width, 50),
                                          )),
                                      onPressed: () async {
                                        if (_feedbackKey.currentState!
                                            .validate()) {
                                          _addFeedback();
                                        }
                                      },
                                      child: Text(
                                        "Submit",
                                        style: GoogleFonts.fugazOne(
                                            color: const Color.fromARGB(
                                                255, 46, 53, 62),
                                            fontSize: 18),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  _addFeedback() async {
    var feedback_id = Uuid().v1();
    feedbackModel _feedback = feedbackModel(
      feedback_email: FirebaseAuth.instance.currentUser!.email,
      feedback_id: feedback_id,
      feedback_description: feedbackDescriptionController.text,
    );

    FeedbackService _feedbackService = FeedbackService();
    try {
      await _feedbackService.createFeedback(_feedback);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => user_home_page(),
      ));
      Fluttertoast.showToast(
        msg: "Feedback sent successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to send feedback: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
