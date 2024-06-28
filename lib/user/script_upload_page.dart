
import 'dart:io';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class script_upload_page extends StatefulWidget {
  const script_upload_page({super.key});

  @override
  State<script_upload_page> createState() => _script_upload_pageState();
}

class _script_upload_pageState extends State<script_upload_page> {
  File? file;
  TextEditingController scriptnamecontroller = TextEditingController();
  TextEditingController scriptdescriptioncontroller = TextEditingController();
  TextEditingController scriptgenrecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.97;
    double height = MediaQuery.of(context).size.height * 0.7;
    Future<File?> selectFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );
      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
      return null;
    }

    Future<void> uploadScriptDetails() async {
      if (file == null) return;
      try {
        final currenttime = DateTime.now().millisecondsSinceEpoch.toString();
        SettableMetadata metadata =
            SettableMetadata(contentType: 'application/pdf');
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child('scriptsfiles/script_$currenttime.pdf')
            .putFile(file!, metadata);
        TaskSnapshot snapshot = await uploadTask;
        String downloadUrl = await snapshot.ref.getDownloadURL();
        String Id = randomAlphaNumeric(10);
        String userid = FirebaseAuth.instance.currentUser!.uid;
        Map<String, dynamic> scriptUploadMap = {
          'scriptid': Id,
          'userid': userid,
          'scriptname': scriptnamecontroller.text,
          'scriptdescription': scriptdescriptioncontroller.text,
          'scriptgenre': scriptgenrecontroller.text,
          'scriptfile': downloadUrl,
          'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        };
        await FirebaseFirestore.instance
            .collection('Scripts')
            .doc(Id)
            .set(scriptUploadMap);
        Fluttertoast.showToast(
          msg: "Script details uploaded successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.of(context).pop();
      } catch (e) {
        Fluttertoast.showToast(
          msg: "Failed to upload script: $e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }

    return Scaffold(
      appBar:  Custom_appbar_real(title: 'Script upload'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                child: ElevatedButton(
                  onPressed: uploadScriptDetails,
                  child:
                      Text('Upload', style: GoogleFonts.fugazOne(fontSize: 15)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 234, 210, 178),
              ),
              width: width,
              height: height,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: TextFormField(
                      style: GoogleFonts.fugazOne(
                          color: const Color.fromARGB(255, 33, 33, 33)),
                      controller: scriptnamecontroller,
                      decoration: InputDecoration(
                        hintText: 'Script name',
                        hintStyle: GoogleFonts.fugazOne(
                            color: const Color.fromARGB(155, 113, 113, 113)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: TextFormField(
                      style: GoogleFonts.fugazOne(
                          color: const Color.fromARGB(255, 33, 33, 33)),
                      controller: scriptdescriptioncontroller,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: GoogleFonts.fugazOne(
                            color: const Color.fromARGB(155, 113, 113, 113)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: TextFormField(
                      style: GoogleFonts.fugazOne(
                          color: const Color.fromARGB(255, 33, 33, 33)),
                      controller: scriptgenrecontroller,
                      decoration: InputDecoration(
                        hintText: 'Genre',
                        hintStyle: GoogleFonts.fugazOne(
                            color: const Color.fromARGB(155, 113, 113, 113)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Icon(Icons.cloud_upload,
                      color: Color.fromARGB(255, 33, 33, 33), size: 100),
                  OutlinedButton(
                    onPressed: () async {
                      file = await selectFile();
                      if (file != null) {
                        Fluttertoast.showToast(
                          msg: "File selected: ${file!.path}",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else {
                        Fluttertoast.showToast(
                          msg: "No file selected",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      }
                    },
                    child: Text(
                      'Choose a file',
                      style:
                          GoogleFonts.fugazOne(color: const Color(0xff36393F)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
