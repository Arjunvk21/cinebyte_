import 'package:cinebyte_network_application/model/meetingsmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MeetingService {
  final CollectionReference _meetingreference =
      FirebaseFirestore.instance.collection('meetings');

  Future<meetingModel> createmeetings(meetingModel meetings) async {
    try {
      final meetingmap = meetings.tomap();
      await _meetingreference.doc(meetings.meetingId).set(meetingmap);
      return meetings;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to upload post: ${e.message}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      rethrow;
    }
  }
}
