import 'package:cloud_firestore/cloud_firestore.dart';

class rentalBookedModel {
  String? rentalBookedId;
  String? rentalProductId;
  DateTime? rentalBookedDate;
  String? rentalProductQuantity;
  String? bookedUserId;

  rentalBookedModel(
      {this.rentalBookedId,
      this.bookedUserId,
      this.rentalBookedDate,
      this.rentalProductId,
      this.rentalProductQuantity});

  factory rentalBookedModel.fromJson(DocumentSnapshot data) {
    return rentalBookedModel(
        rentalBookedId: data['rentalBookedId'],
        rentalProductId: data['rentalProductId'],
        rentalBookedDate: data['rentalBookedDate'],
        rentalProductQuantity: data['rentalProductQuantity'],
        bookedUserId: data['bookedUserId']);
  }

  Map<String, dynamic> toMap() {
    return {
      'rentalBookedId': rentalBookedId,
      'rentalProductId': rentalProductId,
      'rentalBookedDate': rentalBookedDate,
      'rentalProductQuantity': rentalProductQuantity,
      'bookedUserId': bookedUserId
    };
  }
}
