import 'package:cinebyte_network_application/model/shootingsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class shootingService {
  final CollectionReference _shootingcollection =
      FirebaseFirestore.instance.collection('shootings');

  Future<shootingsModel> createShootings(shootingsModel shoots) async {
    try {
      final _shootsMap = shoots.tomap();
      _shootingcollection.doc(shoots.shootingId).set(_shootsMap);
      return shoots;
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to upload",
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

  Stream<List<shootingsModel>> getAllShootings() {
    try {
      return _shootingcollection.snapshots().map((QuerySnapshot snapshot) {
        return snapshot.docs.map((DocumentSnapshot doc) {
          return shootingsModel.fromJson(doc);
        }).toList();
      });
    } catch (e) {
      throw (e);
    }
  }

  Future<void> updateshooting(String? id) async {
    try {
      final shootmap = shootingsModel().tomap();
      await _shootingcollection.doc(id).update(shootmap);
    } catch (e) {
      throw (e);
    }
  }

  Future<void> deleteshootings(String? id) async {
    try {
      await _shootingcollection.doc(id).delete();
    } catch (e) {
      throw (e);
    }
  }
}
