// import 'package:cinebyte_network_application/firebase/groups_service.dart';
// import 'package:cinebyte_network_application/util/appcustomattributes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class groupInfo extends StatefulWidget {
//   String? groupId;
//   String? groupName;
//   String? adminName;
//   groupInfo(
//       {super.key,
//       required this.adminName,
//       required this.groupId,
//       required this.groupName});

//   @override
//   State<groupInfo> createState() => _groupInfoState();
// }

// class _groupInfoState extends State<groupInfo> {
//   Stream? members;
//   @override
//   void initState() {
//     getMembers();
//     super.initState();
//   }

//   getMembers() async {
//     groupsService(uid: FirebaseAuth.instance.currentUser!.uid)
//         .getGroupMembers(widget.groupId)
//         .then((value) {
//       setState(() {
//         members = value;
//       });
//     });
//   }

//   String getName(String? res) {
//     if (res == null) return '';
//     int underscoreIndex = res.indexOf('_');
//     if (underscoreIndex == -1 || underscoreIndex == res.length - 1) {
//       // Handle the case where there is no underscore or the underscore is at the end
//       return '';
//     }
//     return res.substring(underscoreIndex + 1);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: Custom_appbar_real(
//           title: 'Group info',
//           actions: [
//             Padding(
//               padding: const EdgeInsets.only(right: 25),
//               child: IconButton(
//                   onPressed: () {}, icon: const Icon(Icons.exit_to_app)),
//             )
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             children: [
//               Container(
//                 height: 100,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   color: const Color.fromARGB(255, 234, 210, 178),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       CircleAvatar(
//                         radius: 30,
//                         backgroundColor: Color(0xff2D3037),
//                         child: Text(
//                           '${widget.groupName!.substring(0, 1).toUpperCase()}',
//                           style: GoogleFonts.fugazOne(
//                             color: const Color.fromARGB(255, 234, 210, 178),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             '${widget.groupName}',
//                             style: GoogleFonts.fugazOne(
//                               fontSize: 20,
//                               color: Color(0xff2D3037),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text("Admin: ${getName(widget.adminName)}")
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }

// import 'package:cinebyte_network_application/firebase/groups_service.dart';
// import 'package:cinebyte_network_application/util/appcustomattributes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class groupInfo extends StatefulWidget {
//   String? groupId;
//   String? groupName;
//   String? adminName;
//   groupInfo(
//       {super.key,
//       required this.adminName,
//       required this.groupId,
//       required this.groupName});

//   @override
//   State<groupInfo> createState() => _groupInfoState();
// }

// class _groupInfoState extends State<groupInfo> {
//   Stream? members;

//   @override
//   void initState() {
//     getMembers();
//     super.initState();
//   }

//   getMembers() async {
//     groupsService(uid: FirebaseAuth.instance.currentUser!.uid)
//         .getGroupMembers(widget.groupId)
//         .then((value) {
//       setState(() {
//         members = value;
//       });
//     });
//   }

//   String getName(String? res) {
//     if (res == null) return '';
//     int underscoreIndex = res.indexOf('_');
//     if (underscoreIndex == -1 || underscoreIndex == res.length - 1) {
//       // Handle the case where there is no underscore or the underscore is at the end
//       return '';
//     }
//     return res.substring(underscoreIndex + 1);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: Custom_appbar_real(
//         title: 'Group info',
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 25),
//             child: IconButton(
//                 onPressed: () {}, icon: const Icon(Icons.exit_to_app)),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             Container(
//               height: 100,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 color: const Color.fromARGB(255, 234, 210, 178),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     CircleAvatar(
//                       radius: 30,
//                       backgroundColor: Color(0xff2D3037),
//                       child: Text(
//                         '${widget.groupName!.substring(0, 1).toUpperCase()}',
//                         style: GoogleFonts.fugazOne(
//                           color: const Color.fromARGB(255, 234, 210, 178),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           '${widget.groupName}',
//                           style: GoogleFonts.fugazOne(
//                             fontSize: 20,
//                             color: Color(0xff2D3037),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "Admin: ${getName(widget.adminName)}",
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Color(0xff2D3037),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cinebyte_network_application/firebase/groups_service.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class groupInfo extends StatefulWidget {
  String? groupId;
  String? groupName;
  String? adminName;

  groupInfo({
    super.key,
    required this.adminName,
    required this.groupId,
    required this.groupName,
  });

  @override
  State<groupInfo> createState() => _groupInfoState();
}

class _groupInfoState extends State<groupInfo> {
  Stream? members;
  String? adminName;
  @override
  void initState() {
    getMembers();
    adminName = widget.adminName ?? 'No Admin';
    super.initState();
  }

  getMembers() async {
    groupsService(uid: FirebaseAuth.instance.currentUser!.uid)
        .getGroupMembers(widget.groupId)
        .then((value) {
      setState(() {
        members = value;
      });
    });
  }

  String getName(String? res) {
    if (res == null) return 'No Admin';
    int underscoreIndex = res.indexOf('_');
    if (underscoreIndex == res.length - 1) {
      // Handle the case where the underscore is at the end
      return 'No Admin';
    }
    return res.substring(underscoreIndex + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_appbar_real(
        title: 'Group info',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
                onPressed: () {
                  print('-------------${widget.adminName}');
                },
                icon: const Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromARGB(255, 234, 210, 178),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff2D3037),
                      child: Text(
                        '${widget.groupName!.substring(0, 1).toUpperCase()}',
                        style: GoogleFonts.fugazOne(
                          color: const Color.fromARGB(255, 234, 210, 178),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.groupName}',
                          style: GoogleFonts.fugazOne(
                            fontSize: 20,
                            color: Color(0xff2D3037),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Admin: ${getName(widget.adminName)}",
                            style:
                                GoogleFonts.fugazOne(color: Color(0xff2D3037)))
                      ],
                    )
                  ],
                ),
              ),
            ),
            memberList(),
          ],
        ),
      ),
    );
  }

  memberList() {
    return StreamBuilder(
        stream: members,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['members'] != null) {
              if (snapshot.data['members'].length != 0) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              const Color.fromARGB(255, 234, 210, 178),
                          child: Text(
                              style: GoogleFonts.fugazOne(
                                color: Color(0xff2D3037),
                              ),
                              getName(snapshot.data['members'][index])
                                  .substring(0, 1)
                                  .toUpperCase()),
                        ),
                        title: Text(
                            style: GoogleFonts.fugazOne(
                                color:
                                    const Color.fromARGB(255, 234, 210, 178)),
                            getName(snapshot.data['members'][index])),
                      ),
                    );
                  },
                  itemCount: snapshot.data['members'].length,
                );
              } else {
                return Center(
                  child: Text(
                    'No members in this group',
                    style: GoogleFonts.fugazOne(color: Colors.white),
                  ),
                );
              }
            } else {
              return Center(
                child: Text(
                  'No members in this group',
                  style: GoogleFonts.fugazOne(color: Colors.white),
                ),
              );
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
