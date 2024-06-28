import 'package:cloud_firestore/cloud_firestore.dart';

class shootingsModel {
  String? shootingId;
  String? userId;
  String? ShootingImage;
  shootingsModel({this.shootingId, this.ShootingImage, this.userId});

  factory shootingsModel.fromJson(DocumentSnapshot data) {
    return shootingsModel(
        shootingId: data['shootingId'],
        ShootingImage: data['ShootingImage'],
        userId: data['userId']);
  }

  Map<String, dynamic> tomap() {
    return {
      'shootingId': shootingId,
      'ShootingImage': ShootingImage,
      'userId': userId
    };
  }
}
