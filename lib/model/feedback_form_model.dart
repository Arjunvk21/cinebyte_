import 'package:cloud_firestore/cloud_firestore.dart';

class feedbackModel {
  String? feedback_id;
  String? feedback_email;
  String? feedback_description;

  feedbackModel({this.feedback_email,this.feedback_id, this.feedback_description});

  factory feedbackModel.fromjson(DocumentSnapshot data) {
    return feedbackModel(
      feedback_id: data['feedback_id'],
        feedback_email: data['email'],
        feedback_description: data['feedback_description']);
  }
  Map<String, dynamic> tojson() {
    return {
      'feedback_id':feedback_id,
      'email': feedback_email,
      'feedback_description': feedback_description
    };
  }
}
