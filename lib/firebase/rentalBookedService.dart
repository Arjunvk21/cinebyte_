import 'package:cinebyte_network_application/model/rentalBookedModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class rentalBookedService {
  final CollectionReference _rentalBookedCollection =
      FirebaseFirestore.instance.collection('rentalBooked');

  Future<rentalBookedModel> createRentalBooked(rentalBookedModel booked) async {
    try {
      final rentBookMap = booked.toMap();
      await _rentalBookedCollection.doc(booked.rentalBookedId).set(rentBookMap);
      return booked;
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to Book Product",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      throw (e);
    }
  }

  Stream<QuerySnapshot<Object?>> getAllRentalBookedDetails() {
    return _rentalBookedCollection.snapshots();
  }
}
