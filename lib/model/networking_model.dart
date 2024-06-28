import 'package:cinebyte_network_application/model/gallery_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class networkingModel {
  String? groupid;
  String? groupname;
  String? groupdp;
  bool? grouppermission;
  List<String>? members;
  Timestamp createdAt;
  networkingModel(
      {this.groupid,
      this.groupdp,
      this.groupname,
      this.grouppermission,
      this.members,
      required this.createdAt});

  factory networkingModel.fromjson(DocumentSnapshot data) {
    return networkingModel(
        groupid: data['groupid'],
        groupname: data['groupname'],
        groupdp: data['groupdp'],
        grouppermission: data['grouppermission'],
        members: data['members'],
        createdAt: data['createdAt']);
  }

  Map<String, dynamic> tojson() {
    return {
      'groupid': groupid,
      'groupname': groupname,
      'groupdp': groupdp,
      'grouppermission': grouppermission,
      'members': members,
      'createdAt': createdAt
    };
  }
}
