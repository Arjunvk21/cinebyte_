import 'package:cinebyte_network_application/production%20house/groupInfo.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class group_chat_page extends StatefulWidget {
  String? groupId;
  String? groupName;
  String? adminName;
  group_chat_page(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.adminName});

  @override
  State<group_chat_page> createState() => _group_chat_pageState();
}

class _group_chat_pageState extends State<group_chat_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_appbar_real(
        title: '${widget.groupName}',
        actions: [
          GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => groupInfo(
                      groupId: widget.groupId,
                      groupName: widget.groupName,
                      adminName: widget.adminName,
                    ),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Icon(Icons.info),
              ))
        ],
      ),
      body: Center(
        child: Text(
          '${widget.adminName}',
          style: GoogleFonts.fugazOne(color: Colors.white),
        ),
      ),
    );
  }
}
