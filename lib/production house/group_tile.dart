import 'package:cinebyte_network_application/firebase/groups_service.dart';
import 'package:cinebyte_network_application/production%20house/group_chat_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class groupTile extends StatefulWidget {
  final String? userName;
  final String? groupId;
  final String? groupName;
  groupTile({super.key, this.userName, this.groupId, this.groupName});

  @override
  State<groupTile> createState() => _groupTileState();
}

class _groupTileState extends State<groupTile> {
  String? admin;
  Stream<QuerySnapshot>? chats;

  @override
  void initState() {
    getChatandAdmin();
    super.initState();
  }

  getChatandAdmin() {
    groupsService().getChats(widget.groupId).then((value) {
      setState(() {
        chats = value;
      });
    });
    groupsService().getGroupAdmin(widget.groupId).then((value) {
      setState(() {
        admin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => group_chat_page(
            groupId: widget.groupId,
            groupName: widget.groupName,
            adminName: admin,
          ),
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: const Color.fromARGB(255, 234, 210, 178),
            child: Text(
              '${widget.groupName!.substring(0, 1).toUpperCase()}',
              textAlign: TextAlign.center,
              style: GoogleFonts.fugazOne(
                color: const Color.fromARGB(255, 34, 37, 45),
              ),
            ),
          ),
          title: Text(
            '${widget.groupName}',
            style: GoogleFonts.fugazOne(
              fontSize: 20,
              color: const Color.fromARGB(255, 234, 210, 178),
            ),
          ),
          subtitle: Text(
            'Join the conversation as ${widget.userName}',
            style: GoogleFonts.fugazOne(
              color: const Color.fromARGB(255, 234, 210, 178),
            ),
          ),
        ),
      ),
    );
  }
}
