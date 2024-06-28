import 'package:cloud_firestore/cloud_firestore.dart';

class rentalService {
  final CollectionReference _rentalCollection =
      FirebaseFirestore.instance.collection('rentals');

   Stream<QuerySnapshot<Object?>> getAllRentalDetails()  {
    return  _rentalCollection.snapshots();
  }
}
