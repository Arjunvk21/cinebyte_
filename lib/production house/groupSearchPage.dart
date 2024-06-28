import 'package:cinebyte_network_application/firebase/groups_service.dart';
import 'package:cinebyte_network_application/production%20house/group_chat_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  TextEditingController searchController = TextEditingController();
  List<DocumentSnapshot> allGroups = [];
  List<DocumentSnapshot> filteredGroups = [];
  String? adminName;
  bool isJoined = false;
  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection('users');

  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterUsers);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterUsers);
    searchController.dispose();
    super.dispose();
  }

  void _filterUsers() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredGroups = allGroups.where((group) {
        String groupName = group['groupName'].toString().toLowerCase();
        return groupName.contains(query);
      }).toList();
    });
  }

  String? getNameFromAdminField(String adminField) {
    if (adminField.isEmpty || !adminField.contains('_')) return 'No Admin';

    // Split by underscore and return the name part
    List<String> parts = adminField.split('_');
    if (parts.length > 1) {
      adminName = parts[1];
      return adminName; // Assuming the name is after the underscore
    } else {
      return 'No Admin'; // Handle unexpected format
    }
  }

  Future<bool> isUserJoined(
      String groupName, String groupId, String userName) async {
    DocumentReference userDocumentReference = usercollection.doc(uid);
    DocumentSnapshot documentSnapshot = await userDocumentReference.get();

    List<dynamic> groups = await documentSnapshot['userGroups'];
    if (groups.contains("${groupId}_$groupName")) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Stream groupstream =
        FirebaseFirestore.instance.collection('groups').snapshots();
    return Scaffold(
      appBar: Custom_appbar_real(title: 'Search'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextFormField(
              controller: searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  hintText: 'Search',
                  hintStyle: GoogleFonts.fugazOne(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(),
                  )),
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: groupstream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No groups found.'));
                  }

                  allGroups = snapshot.data!.docs;
                  filteredGroups = searchController.text.isEmpty
                      ? allGroups
                      : allGroups.where((group) {
                          String groupName =
                              group['groupName'].toString().toLowerCase();
                          String query = searchController.text.toLowerCase();
                          return groupName.contains(query);
                        }).toList();
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final ds = filteredGroups[index];
                      return FutureBuilder<bool>(
                        future:
                            isUserJoined(ds['groupName'], ds.id, ds['admin']),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          // bool isJoined = snapshot.data ?? false;
                          return GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => group_chat_page(
                                groupId: ds.id,
                                adminName: ds['admin'],
                                groupName: ds['groupName'],
                              ),
                            )),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 234, 210, 178),
                                    borderRadius: BorderRadius.circular(8)),
                                height: 100,
                                width: 500,
                                child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text(
                                          '${ds['groupName']!.substring(0, 1).toUpperCase()}'),
                                      // backgroundImage: NetworkImage(ds['image']),
                                    ),
                                    title: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          ds['groupName'],
                                          style: GoogleFonts.fugazOne(
                                            color: const Color(0xff2D3037),
                                          ),
                                        ),
                                        Text(
                                          "Admin : ${getNameFromAdminField(ds['admin'])}",
                                          style: GoogleFonts.fugazOne(
                                              color: const Color(0xff2D3037),
                                              fontSize: 13),
                                        ),
                                        // Text(
                                        //   ds['userLocation'] ?? 'No Location Added',
                                        //   style: GoogleFonts.fugazOne(
                                        //       color: const Color(0xff2D3037),
                                        //       fontSize: 13),
                                        // ),
                                      ],
                                    ),
                                    trailing: InkWell(
                                        onTap: () async {
                                          groupsService(
                                                  uid: FirebaseAuth.instance
                                                      .currentUser!.uid)
                                              .toggleGroupJoin(ds.id,
                                                  ds['groupName'], ds['admin']);

                                          if (isJoined) {
                                            setState(() {
                                              isJoined = !isJoined;
                                            });
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      group_chat_page(
                                                          groupId: ds.id,
                                                          groupName:
                                                              ds['groupName'],
                                                          adminName:
                                                              ds['admin']),
                                                ),
                                              );
                                            });
                                            Fluttertoast.showToast(
                                              msg:
                                                  "Successfully joined the group",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.green,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                          } else {
                                            setState(() {
                                              isJoined = !isJoined;
                                            });
                                            Fluttertoast.showToast(
                                              msg:
                                                  "Left the group: ${ds['groupName']}",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
                                          }
                                        },
                                        child: isJoined
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 238, 202, 155),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text('Joined',
                                                    style: GoogleFonts.fugazOne(
                                                      fontSize: 15,
                                                      color: const Color(
                                                          0xff2D3037),
                                                    )),
                                              )
                                            : Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff2D3037),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Text('Join Now',
                                                    style: GoogleFonts.fugazOne(
                                                      fontSize: 12,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              234,
                                                              210,
                                                              178),
                                                    )),
                                              ))),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: filteredGroups.length,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
