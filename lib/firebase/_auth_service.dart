import 'package:cinebyte_network_application/model/model.dart';
import 'package:cinebyte_network_application/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usercollection =
      FirebaseFirestore.instance.collection('users');

  Future<UserCredential?> registerUser(UserModel userdetails) async {
    UserCredential userdata = await _auth.createUserWithEmailAndPassword(
        email: userdetails.email.toString(),
        password: userdetails.password.toString());
    _usercollection.doc(userdata.user!.uid).set({
      'userid': userdata.user!.uid,
      'email': userdata.user!.email,
      'password': userdetails.password,
      'name': userdetails.name,
      'experience': userdetails.experience,
      'skill': userdetails.skill,
      'image': userdetails.image,
      'userLocation':userdetails.userLocation,
      'userGroups':userdetails.userGroup,
    });
    return userdata;
  }

  Future<DocumentSnapshot?> loginUser(UserModel userdetails) async {
    DocumentSnapshot? snap;
    SharedPreferences _pref = await SharedPreferences.getInstance();
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userdetails.email.toString(),
        password: userdetails.password.toString());
    String? token = await userCredential.user!.getIdToken();
    snap = await _usercollection.doc(userCredential.user!.uid).get();
    await _pref.setString('token', token!);
    await _pref.setString('email', snap['email']);
    await _pref.setString('userid', snap['userid']);
    return snap;
  }

  Future<void> logout() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.clear();
    await _auth.signOut();
  }

  Future<bool> isLoggedin() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String? _token = await _pref.getString('token');
    if (_token == null) {
      return false;
    }
    return true;
  }
}
