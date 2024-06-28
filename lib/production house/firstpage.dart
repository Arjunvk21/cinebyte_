import 'dart:async';

import 'package:cinebyte_network_application/production%20house/get_started_page.dart';
import 'package:cinebyte_network_application/user/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  String? email;
  String? userid;
  String? _token;

  getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _token = _pref.getString('token');
    email = _pref.getString('email');
    userid = _pref.getString('userid');
  }

  @override
  void initState() {
    getData();
    var d = Duration(seconds: 3);
    Future.delayed(d, () {
      checkloginstatus();
    });

    // TODO: implement initState
    super.initState();
  }

  Future<void> checkloginstatus() async {
    if (_token == null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => get_started_page(),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => custombottomnavigationbar(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "CineByte Network",
            style: GoogleFonts.fugazOne(
                color: Color.fromARGB(255, 244, 207, 139), fontSize: 30),
          ),
          Text("I would rather die of passion than boredom",
              style: GoogleFonts.fugazOne(
                color: Color.fromARGB(255, 244, 207, 139),
              ))
        ],
      ),
    ));
  }
}
