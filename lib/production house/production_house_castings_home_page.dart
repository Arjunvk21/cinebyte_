import 'package:cinebyte_network_application/production%20house/casting_call_clicked_page.dart';
import 'package:cinebyte_network_application/production%20house/create_casting_calls.dart';
import 'package:cinebyte_network_application/user/user_castingcall_apply.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class casting_home_page extends StatefulWidget {
  const casting_home_page({super.key});

  @override
  State<casting_home_page> createState() => _casting_home_pageState();
}

class _casting_home_pageState extends State<casting_home_page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar: Custom_appbar_real(title: 'Casting calls'),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('castingcalls')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                    return Center(
                      child: Text(
                        'No Data Found',
                        style: GoogleFonts.fugazOne(color: Colors.white),
                      ),
                    );
                  }

                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final data = snapshot.data!.docs[index];
                        return Padding(
                          // <-- return Padding widget here
                          padding: const EdgeInsets.all(15),
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  user_casting_calls_clicked_page(
                                image: data['poster'],whatsappNumber: data['whatsappNumber'],emailID: data['emailid'],instaID: data['instagramid'],
                              ),
                            )),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: Color.fromARGB(255, 234, 210, 178),
                              ),
                              clipBehavior: Clip.hardEdge,
                              width: width,
                              height: 180,
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(15),
                              //   color: Color.fromARGB(255, 234, 210, 178),
                              // ),
                              // margin: EdgeInsets.only(top: 50),

                              child: Image.network(
                                '${data['poster']}',
                                scale: 5,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                    );
                  }
                  return Center(
                    child: Text(
                      'Some error occured',
                      style: GoogleFonts.fugazOne(color: Colors.white),
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => create_casting_calls(),
          ));
        },
        backgroundColor: Color.fromARGB(255, 234, 210, 178),
        child: Icon(Icons.add),
      ),
    );
  }
}
