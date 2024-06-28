import 'package:cinebyte_network_application/firebase/groups_service.dart';
import 'package:cinebyte_network_application/production%20house/groupSearchPage.dart';
import 'package:cinebyte_network_application/production%20house/group_tile.dart';
import 'package:cinebyte_network_application/user/map_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class groupPage extends StatefulWidget {
  const groupPage({super.key});

  @override
  State<groupPage> createState() => _groupPageState();
}

class _groupPageState extends State<groupPage> {
  bool _isloading = false;
  String groupName = '';
  String userName = '';
  Stream? groups;

  @override
  void initState() {
    getuserGroupsStream();
    getCurrentUserName();
    super.initState();
  }

  String getId(String res) {
    return res.substring(0, res.indexOf('_'));
  }

  Future<void> getCurrentUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        setState(() {
          userName = userDoc['name']; // Assuming the field is 'userName'
        });
      }
    }
  }

  // String getName(String res) {
  //   return res.substring(0, res.indexOf('_') + 1);
  // }

  String getName(String res) {
    int underscoreIndex = res.indexOf('_');
    if (underscoreIndex == -1 || underscoreIndex == res.length - 1) {
      // Handle the case where there is no underscore or the underscore is at the end
      return '';
    }
    return res.substring(underscoreIndex + 1);
  }

  getuserGroupsStream() async {
    userid = FirebaseAuth.instance.currentUser!.uid;
    await groupsService().getUserGroups(userid).then((snapshot) {
      setState(() {
        groups = snapshot;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_appbar_real(
        title: 'Groups',
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => searchPage(),
                    )),
                child: Icon(Icons.search)),
          )
        ],
      ),
      body: groupList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          popUpDialog(context);
        },
        backgroundColor: Color.fromARGB(255, 234, 210, 178),
        child: Icon(Icons.add),
      ),
    );
  }

  popUpDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setstate) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 234, 210, 178),
            title: Text(
              'Create a Group',
              style: GoogleFonts.fugazOne(
                  color: const Color.fromARGB(255, 34, 37, 45), fontSize: 20),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _isloading == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : TextField(
                        onChanged: (value) {
                          setState(() {
                            groupName = value;
                          });
                        },
                        style: GoogleFonts.fugazOne(
                          color: Color.fromARGB(255, 34, 37, 45),
                        ),
                      )
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.fugazOne(
                      color: const Color.fromARGB(255, 234, 210, 178)),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 34, 37, 45),
                )),
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (groupName != null) {
                      setState(() {
                        _isloading = true;
                      });
                      groupsService(uid: FirebaseAuth.instance.currentUser!.uid)
                          .createGroup(userName,
                              FirebaseAuth.instance.currentUser!.uid, groupName)
                          .whenComplete(() {
                        _isloading = false;
                      });
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(
                        msg: "Group created succesfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                  child: Text(
                    'Create',
                    style: GoogleFonts.fugazOne(
                        color: const Color.fromARGB(255, 234, 210, 178)),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 34, 37, 45),
                  )))
            ],
          );
        });
      },
    );
  }

  groupList() {
    return StreamBuilder(
      stream: groups,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data['userGroups'] != null) {
            if ((snapshot.data['userGroups'] as List).isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data['userGroups'].length,
                itemBuilder: (context, index) {
                  int reverseIndex =
                      snapshot.data['userGroups'].length - index - 1;
                  return groupTile(
                    groupId: getId(snapshot.data['userGroups'][reverseIndex]),
                    groupName:
                        getName(snapshot.data['userGroups'][reverseIndex]),
                    userName: snapshot.data['name'],
                  );
                },
              );
            } else {
              return noGroupWidget();
            }
          } else {
            return noGroupWidget();
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  noGroupWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => popUpDialog(context),
              child: const Icon(
                Icons.add_circle,
                color: Color.fromARGB(255, 234, 210, 178),
                size: 70,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "You've not joined any groups, tap on the add icon to create a group or also search from top search",
              textAlign: TextAlign.center,
              style: GoogleFonts.fugazOne(
                  color: const Color.fromARGB(255, 234, 210, 178)),
            )
          ],
        ),
      ),
    );
  }
}
