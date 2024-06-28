import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class meetingModel {
  String? scriptName;
  String? meetingId;
  String? senderUserId;
  String? receiverUserId;
  String? meetingDescription;
  String? availableDates1;
  TimeOfDay? availableTime1;
  String? availableDates2;
  TimeOfDay? availableTime2;
  String? availableDates3;
  TimeOfDay? availableTime3;
  String? meetingType;
  String? meetingStatus;
  String? confirmedDate;

  meetingModel({
    this.scriptName,
    this.meetingId,
    this.senderUserId,
    this.receiverUserId,
    this.meetingDescription,
    this.availableDates1,
    this.availableTime1,
    this.availableDates2,
    this.availableTime2,
    this.availableDates3,
    this.availableTime3,
    this.meetingType,
    this.confirmedDate,
    required this.meetingStatus,
  });

  factory meetingModel.fromJson(DocumentSnapshot data) {
    return meetingModel(
        scriptName: data['scriptName'],
        meetingId: data['meetingId'],
        senderUserId: data['senderUserId'],
        receiverUserId: data['receiverUserId'],
        meetingDescription: data['meetingDescription'],
        availableDates1: data['availableDates1'],
        confirmedDate: data['confirmedDate'],
        availableTime1: TimeOfDay(
          hour: data['availableTime1']['hour'],
          minute: data['availableTime1']['minute'],
        ),
        availableDates2: data['availableDates2'],
        availableTime2: TimeOfDay(
          hour: data['availableTime2']['hour'],
          minute: data['availableTime2']['minute'],
        ),
        availableDates3: data['availableDates3'],
        availableTime3: TimeOfDay(
          hour: data['availableTime3']['hour'],
          minute: data['availableTime3']['minute'],
        ),
        meetingType: data['meetingType'],
        meetingStatus: data['meetingStatus']);
  }

  Map<String, dynamic> tomap() {
    return {
      'scriptName': scriptName,
      'meetingId': meetingId,
      'senderUserId': senderUserId,
      'receiverUserId': receiverUserId,
      'meetingDescription': meetingDescription,
      'availableDates1': availableDates1 != null ? availableDates1! : null,
      'availableTime1': availableTime1 != null
          ? {'hour': availableTime1!.hour, 'minute': availableTime1!.minute}
          : null,
      'availableDates2': availableDates2 != null ? availableDates2! : null,
      'availableTime2': availableTime2 != null
          ? {'hour': availableTime2!.hour, 'minute': availableTime2!.minute}
          : null,
      'availableDates3': availableDates3 != null ? availableDates3! : null,
      'availableTime3': availableTime3 != null
          ? {'hour': availableTime3!.hour, 'minute': availableTime3!.minute}
          : null,
      'meetingType': meetingType,
      'meetingStatus': meetingStatus,
      'confirmedDate': confirmedDate
    };
  }
}
