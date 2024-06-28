import 'package:cinebyte_network_application/model/gallery_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class galleryService {
  final CollectionReference _gallerycollection =
      FirebaseFirestore.instance.collection('gallery');

  Future<galleryModel> createpost(galleryModel gallery) async {
    try {
      final postmap = gallery.tojson();
      await _gallerycollection.doc(gallery.postid).set(postmap);
      return gallery;
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
