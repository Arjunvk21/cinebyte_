import 'package:cinebyte_network_application/production%20house/groups_view_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class create_group_2 extends StatefulWidget {
  const create_group_2({super.key});

  @override
  State<create_group_2> createState() => _create_group_2State();
}

class _create_group_2State extends State<create_group_2> {
  @override
  Widget build(BuildContext context) {
    String? gender;
    return Scaffold(
      appBar: Custom_appbar_real(title: 'Create group'),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 50,
              ),
              title: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Group name',
                    hintStyle:
                        GoogleFonts.acme(color: Colors.grey, fontSize: 20)),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                'Group permission',
                style: GoogleFonts.acme(color: Colors.white, fontSize: 22),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100, top: 20),
                  child: ListTile(
                    leading: Radio<String>(
                      value: 'Public',
                      groupValue: gender,
                      onChanged: (String? value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                      activeColor: const Color.fromARGB(255, 255, 255,
                          255), // Set active color for selected radio button
                    ),
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Public',
                              // Replace with your actual value
                              style: GoogleFonts.acme(
                                  color: Colors.white,
                                  fontSize: 20) // Set desired color for value
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, top: 20),
                  child: ListTile(
                    leading: Radio<String>(
                      value: 'Public',
                      groupValue: gender,
                      onChanged: (String? value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                      activeColor: const Color.fromARGB(255, 255, 255,
                          255), // Set active color for selected radio button
                    ),
                    title: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Private',
                              // Replace with your actual value
                              style: GoogleFonts.acme(
                                  color: Colors.white,
                                  fontSize: 20) // Set desired color for value
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => Networking(),
          // ));
        },
        backgroundColor: Color.fromARGB(255, 234, 210, 178),
        child: Icon(Icons.send),
      ),
    );
  }
}
