import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? email;
  String? password;
  String? userid;
  String? image;
  String? experience;
  String? skill;
  String? userLocation;
  List<String>? userGroup = [];

  UserModel(
      {this.name,
      this.email,
      this.password,
      this.userid,
      this.experience,
      this.image,
      this.userLocation,
      this.userGroup,
      this.skill});
  factory UserModel.fromjson(DocumentSnapshot data) {
    return UserModel(
        email: data['name'],
        name: data['name'],
        userid: data['userid'],
        experience: data['experience'],
        password: data['password'],
        image: data['image'],
        userLocation: data['userLocation'],
        userGroup: data['userGroup'],
        skill: data['skill']);
  }
  Map<String, dynamic> tojson() {
    return {
      'userid': userid,
      'name': name,
      'email': email,
      'password': password,
      'experience': experience,
      'skill': skill,
      'image': image,
      'userLocation': userLocation,
      'userGroup':userGroup
    };
  }
}
