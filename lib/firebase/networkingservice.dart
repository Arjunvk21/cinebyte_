import 'package:cinebyte_network_application/model/networking_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class networkingservice {
  final CollectionReference _networingcollection =
      FirebaseFirestore.instance.collection('groups');

  Future<networkingModel?> creategroup(networkingModel network) async {
    try {
      final networkmap = network.tojson();
      await _networingcollection.doc(network.groupid).set(networkmap);
      return network;
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
    } 
    // catch (e) {
    //   Fluttertoast.showToast(
    //     msg: "some error occured: ${e.message}",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0,
    //   );
    // }
  }
}
