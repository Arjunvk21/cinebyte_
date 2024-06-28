import 'package:cinebyte_network_application/firebase/databasemethods.dart';
import 'package:cinebyte_network_application/production%20house/production_house_script_download.dart';
import 'package:cinebyte_network_application/user/script_upload_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class producton_house_scripts_page extends StatefulWidget {
  const producton_house_scripts_page({super.key});

  @override
  State<producton_house_scripts_page> createState() =>
      _producton_house_scripts_pageState();
}

class _producton_house_scripts_pageState
    extends State<producton_house_scripts_page> {
  String userid = FirebaseAuth.instance.currentUser!.uid;
  Stream? userstream;
  Stream? scriptstream;

  getOnTheLoad() async {
    Stream Usersstream = await DatabaseMethods().getuserdetails(userid);
    Stream Scriptstream = await DatabaseMethods().getscriptdetails();
    userstream = Usersstream;
    scriptstream = Scriptstream;
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: Custom_appbar_real(title: 'Scripts'),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: scriptstream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    'Some error occurred',
                    style: GoogleFonts.fugazOne(color: Colors.white),
                  ));
                }
                if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final document = docs[index];

                      final uid = document['userid'];

                      final user = db.collection('users').doc(uid).snapshots();

                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: GestureDetector(
                            onTap: () async {
                              DocumentSnapshot usersnapshot =
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(document['userid'])
                                      .get();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context){
                                  return  production_house_script_download_page(
                                        scripts:document,
                                        );
                                }
                                   
                              ));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(255, 234, 210, 178),
                              ),
                              width: width,
                              height: 180,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 20),
                                          child: StreamBuilder(
                                            stream: user,
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return CircularProgressIndicator();
                                              }
                                              return Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                        snapshot.data!['image'],
                                                      )),
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                              );
                                            },
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 10),
                                        child: Text(
                                          '${document['scriptname']}',
                                          style: GoogleFonts.acme(
                                            color: const Color(0xff2D3037),
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Text(
                                          '${document['date']}', // Example date, you might want to format data['timestamp'] if available
                                          style: GoogleFonts.acme(
                                            color: const Color(0xff2D3037),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(),
                                    child: Divider(
                                      thickness: 1,
                                      color: Color(0xff36393F),
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 17),
                                            child: Text(
                                              '''${document['scriptdescription']}''',
                                              style: GoogleFonts.acme(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 17),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Genre : ${document['scriptgenre']} ',
                                            style: GoogleFonts.acme(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      'No scripts available',
                      style: GoogleFonts.fugazOne(color: Colors.white),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const script_upload_page(),
          ));
        },
        backgroundColor: const Color.fromARGB(255, 234, 210, 178),
        child: const Icon(Icons.add),
      ),
    );
  }
}
