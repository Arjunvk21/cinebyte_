// import 'package:cinebyte_network_application/model/feedback_form_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class feedbackService {
//   final CollectionReference _feedbackcollection =
//       FirebaseFirestore.instance.collection('feedback');

// //create feedback
//   Future<feedbackModel?> createFeedback(feedbackModel feedback) async {
//     try {
//       final feedbackmap = feedbackModel().tojson();
//       await _feedbackcollection.doc(feedback.feedback_id).set(feedbackmap);
//       Fluttertoast.showToast(
//         msg: "feedback sented Succesfully:",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//       return feedback;
//     } on FirebaseAuthException catch (e) {
//       Fluttertoast.showToast(
//         msg: "Failed to send feedback: $e",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     }
//   }
// }

import 'package:cinebyte_network_application/model/feedback_form_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedbackService {
  final CollectionReference _feedbackCollection =
      FirebaseFirestore.instance.collection('feedback');

  // Create feedback
  Future<feedbackModel?> createFeedback(feedbackModel feedback) async {
    try {
      final feedbackMap =
          feedback.tojson(); // Use the instance passed to the method
      await _feedbackCollection.doc(feedback.feedback_id).set(feedbackMap);
      // Fluttertoast.showToast(
      //   msg: "Feedback sent successfully",
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.CENTER,
      //   timeInSecForIosWeb: 1,
      //   backgroundColor: Colors.green,
      //   textColor: Colors.white,
      //   fontSize: 16.0,
      // );
      return feedback;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to send feedback: ${e.message}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return null;
    } catch (e) {
      Fluttertoast.showToast(
        msg: "An error occurred: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return null;
    }
  }

  // getall feedback
  Stream<List<feedbackModel>> getallFeedbacks() {
    final useremail = FirebaseAuth.instance.currentUser!.email;
    try {
      return _feedbackCollection.where('email',isEqualTo:useremail ).snapshots().map((QuerySnapshot snapshot) {
        return snapshot.docs.map((DocumentSnapshot doc) {
          return feedbackModel.fromjson(doc);
        }).toList();
      });
    } on FirebaseAuthException catch (e) {
      throw (e);
    }
  }
}
