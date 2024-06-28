import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class user_search_page extends StatelessWidget {
  const user_search_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_appbar_real(title: 'Search users'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(60),
            child: TextFormField(style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  hintText: 'Search',
                  hintStyle: GoogleFonts.fugazOne(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}