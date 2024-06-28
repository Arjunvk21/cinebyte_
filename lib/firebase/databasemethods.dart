import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethods {
  Future<Stream<QuerySnapshot>> getuserdetails(String uid) async {
    return await FirebaseFirestore.instance.collection('Users').snapshots();
  }

  Future<Stream<QuerySnapshot>> getscriptdetails() async {
    return await FirebaseFirestore.instance.collection('Scripts').snapshots();
  }
  Future<Stream<QuerySnapshot>> getrentaldetails() async {
    return await FirebaseFirestore.instance.collection('rentals').snapshots();
  }
  
}
