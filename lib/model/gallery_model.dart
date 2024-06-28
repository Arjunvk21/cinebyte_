import 'package:cloud_firestore/cloud_firestore.dart';

class galleryModel {
  String? postname;
  String? postdescription;
  String? postid;
  String? postdata;
  String? userid;
  // bool? likedornot;
  // List<String>? comments;

  galleryModel(
      {this.postid,
      this.userid,
      this.postdata,
      this.postname,
      this.postdescription,
      // this.likedornot,
      // this.comments
      });

  factory galleryModel.fromjson(DocumentSnapshot data) {
    return galleryModel(
      postid: data['postid'],
      postname: data['postname'],
      postdescription: data['postdescription'],
      postdata: data['postdata'],
      userid: data['userid'],
      // likedornot: data['likedornot'] ?? false,
      // comments: List<String>.from(data['comments'] ?? []),
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'postid': postid,
      'postname': postname,
      'postdescription': postdescription,
      'postdata': postdata,
      'userid': userid,
      // 'likedornot': likedornot,
      // 'comments': comments ?? []
    };
  }
}
