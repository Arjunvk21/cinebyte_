import 'dart:async';

import 'package:cinebyte_network_application/model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class firebaseHelper {
  final _firebase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  Future addfirebase(
      Map<String, dynamic> registereduserinfomap, String userid) async {
    return _firebase
        .collection('firebase')
        .doc(userid)
        .set(registereduserinfomap);
  }

  Future fetchuser(userid) async {
    await _firebase.collection('users').where('id', isEqualTo: userid).get();
    // _firstor.collection('Users').doc(id).snapshots(),
  }

  // Future addfeedback(
  //     Map<String, dynamic> feedbackinfomap, String userid) async {
  //   return await _firebase
  //       .collection('feedback')
  //       .doc(userid)
  //       .set(feedbackinfomap);
  // }

  Future addpost(Map<String, dynamic> postuploadmap, String userid) async {
    return await _firebase.collection('posts').doc(userid).set(postuploadmap);
  }

  Future addscripts(Map<String, dynamic> scriptuploadmap, String userid) async {
    return await _firebase
        .collection('Scripts')
        .doc(userid)
        .set(scriptuploadmap);
  }

  Future addcastingcalls(
      Map<String, dynamic> scriptuploadmap, String userid) async {
    try {
      await _firebase
          .collection('castingcalls')
          .doc(userid)
          .set(scriptuploadmap);
      print('Casting call poster added successfully');
    } catch (e) {
      print('Error adding casting call poster: $e');
    }
  }
}
