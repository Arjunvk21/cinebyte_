import 'package:cinebyte_network_application/production%20house/create_group.dart';
import 'package:cinebyte_network_application/user/p2pchatPage.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Networking extends StatefulWidget {
  const Networking({super.key});

  @override
  State<Networking> createState() => _NetworkingState();
}

class _NetworkingState extends State<Networking> {
  final TextEditingController searchController = TextEditingController();
  List<DocumentSnapshot> allUsers = [];
  List<DocumentSnapshot> filteredUsers = [];
  @override
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
      filteredUsers = allUsers.where((user) {
        String name = user['name'].toString().toLowerCase();
        String skill = user['skill'].toString().toLowerCase();
        String location = user['userLocation'].toString().toLowerCase();
        return name.contains(query) ||
            skill.contains(query) ||
            location.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Stream userstream =
        FirebaseFirestore.instance.collection('users').snapshots();

    return Scaffold(
      appBar: Custom_appbar_real(
        title: 'Networking',
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => groupPage(),));
              },
              icon: const Icon(Icons.group))
        ],
      ),
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
                stream: userstream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No users found.'));
                  }

                  allUsers = snapshot.data!.docs;
                  filteredUsers = searchController.text.isEmpty
                      ? allUsers
                      : allUsers.where((user) {
                          String name = user['name'].toString().toLowerCase();
                          String skill = user['skill'].toString().toLowerCase();
                          String location =
                              user['userLocation'].toString().toLowerCase();
                          String query = searchController.text.toLowerCase();
                          return name.contains(query) ||
                              skill.contains(query) ||
                              location.contains(query);
                        }).toList();
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final ds = filteredUsers[index];
                      return GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChatPage(
                            userId: ds.id,
                            userName: ds['name'],
                          ),
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 234, 210, 178),
                                borderRadius: BorderRadius.circular(8)),
                            height: 100,
                            width: 500,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(ds['image']),
                              ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ds['name'],
                                    style: GoogleFonts.fugazOne(
                                      color: const Color(0xff2D3037),
                                    ),
                                  ),
                                  Text(
                                    "Skill : ${ds['skill'] ?? 'No Skill Added'}",
                                    style: GoogleFonts.fugazOne(
                                        color: const Color(0xff2D3037),
                                        fontSize: 13),
                                  ),
                                  Text(
                                    ds['userLocation'] ?? 'No Location Added',
                                    style: GoogleFonts.fugazOne(
                                        color: const Color(0xff2D3037),
                                        fontSize: 13),
                                  ),
                                ],
                              ),
                              trailing: Text(
                                'Experience :${ds['experience']}',
                                style: GoogleFonts.fugazOne(
                                  color: const Color(0xff2D3037),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: filteredUsers.length,
                  );
                }),
          ),
        ],
      ),
    );
  }
}


