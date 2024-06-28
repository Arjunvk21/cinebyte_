// import 'dart:io';
// import 'package:cinebyte_network_application/production%20house/production_house_castings_home_page.dart';
// import 'package:cinebyte_network_application/user/gallery_page.dart';
// import 'package:cinebyte_network_application/util/appcustomattributes.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:random_string/random_string.dart';

// class create_casting_calls extends StatefulWidget {
//   const create_casting_calls({super.key});

//   @override
//   State<create_casting_calls> createState() => _create_casting_callsState();
// }

// class _create_casting_callsState extends State<create_casting_calls> {
//   File? file;
//   File? selectedimage;

//   // Future<File?> selectFile() async {
//   //   FilePickerResult? result = await FilePicker.platform.pickFiles(
//   //     allowMultiple: false,
//   //     type: FileType.image,
//   //   );
//   //   if (result != null && result.files.single.path != null) {
//   //     return File(result.files.single.path!);
//   //   }
//   //   return null;
//   // }
//   Future _pickedImageGallery() async {
//     final pickedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedImage == null) return;
//     setState(() {
//       selectedimage = File(pickedImage.path);
//     });
//   }

//   Future<void> uploadcastingdetails() async {
//     if (file == null) return;
//     try {
//       String userId = FirebaseAuth.instance.currentUser!.uid;
//       final currenttime = DateTime.now().millisecondsSinceEpoch.toString();
//       SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
//       UploadTask uploadTask = FirebaseStorage.instance
//           .ref()
//           .child('castingcallfiles/castingcall_$currenttime')
//           .putFile(selectedimage!, metadata);
//       TaskSnapshot snapshot = await uploadTask;
//       String downloadUrl = await snapshot.ref.getDownloadURL();
//       String Id = randomAlphaNumeric(10);
//       Map<String, dynamic> castingUploadMap = {
//         'castingId': Id,
//         'poster': downloadUrl
//       };

//       await FirebaseFirestore.instance
//           .collection('castingcalls')
//           .doc(Id)
//           .set(castingUploadMap);

//       Fluttertoast.showToast(
//         msg: "Casting details uploaded successfully",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );

//       Navigator.of(context).pop();
//     } catch (e) {
//       Fluttertoast.showToast(
//         msg: "Error uploading casting details: $e",
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.CENTER,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.8;

//     return Scaffold(
//       appBar: const Custom_appbar_real(title: 'Create casting calls'),
//       body: Center(
//         child: Column(
//           children: [
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: ElevatedButton(
//                 style: const ButtonStyle(
//                   backgroundColor: MaterialStatePropertyAll(
//                     Color.fromARGB(255, 229, 206, 177),
//                   ),
//                   minimumSize: MaterialStatePropertyAll(Size(200, 40)),
//                 ),
//                 onPressed: () {
//                   uploadcastingdetails().then(
//                     (value) => Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const casting_home_page(),
//                       ),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   "Upload",
//                   style: GoogleFonts.fugazOne(
//                     color: const Color.fromARGB(255, 46, 53, 62),
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: width,
//               height: 300,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 229, 206, 177),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(bottom: 30),
//                     child: Icon(
//                       Icons.cloud_upload,
//                       color: Color.fromARGB(255, 46, 53, 62),
//                       size: 120,
//                     ),
//                   ),
//                   OutlinedButton(
//                     onPressed: () async {
//                       file = await _pickedImageGallery();
//                       if (file != null) {
//                         Fluttertoast.showToast(
//                           msg: "File selected: ${file!.path}",
//                           toastLength: Toast.LENGTH_SHORT,
//                           gravity: ToastGravity.BOTTOM,
//                           backgroundColor: Colors.green,
//                           textColor: Colors.white,
//                           fontSize: 16.0,
//                         );
//                       } else {
//                         Fluttertoast.showToast(
//                           msg: "No file selected",
//                           toastLength: Toast.LENGTH_SHORT,
//                           gravity: ToastGravity.BOTTOM,
//                           backgroundColor: Colors.red,
//                           textColor: Colors.white,
//                           fontSize: 16.0,
//                         );
//                       }
//                     },
//                     child: Text(
//                       'Upload a file',
//                       style: GoogleFonts.fugazOne(
//                         color: const Color(0xff2D3037),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:cinebyte_network_application/production%20house/production_house_castings_home_page.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class create_casting_calls extends StatefulWidget {
  const create_casting_calls({super.key});

  @override
  State<create_casting_calls> createState() => _create_casting_callsState();
}

class _create_casting_callsState extends State<create_casting_calls> {
  File? file;
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> _pickImageFromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          file = File(pickedImage.path);
        });
      } else {
        Fluttertoast.showToast(
          msg: "No image selected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error picking image: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future<void> uploadCastingDetails() async {
    if (file == null) {
      Fluttertoast.showToast(
        msg: "Please select an image first",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }

    try {
      final currentTime = DateTime.now().millisecondsSinceEpoch.toString();
      SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('castingcallfiles/castingcall_$currentTime.jpeg')
          .putFile(file!, metadata);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      String id = randomAlphaNumeric(10);
      Map<String, dynamic> castingUploadMap = {
        'castingId': id,
        'whatsappNumber': whatsappController.text,
        'instagramid': instagramController.text,
        'emailid': emailController.text,
        'poster': downloadUrl
      };

      await FirebaseFirestore.instance
          .collection('castingcalls')
          .doc(id)
          .set(castingUploadMap)
          .then((value) => Navigator.of(context).pop());

      Fluttertoast.showToast(
        msg: "Casting details uploaded successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error uploading casting details: $e",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;

    return Scaffold(
      appBar:  Custom_appbar_real(title: 'Create casting calls'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 229, 206, 177),
                    ),
                    minimumSize: MaterialStatePropertyAll(Size(200, 40)),
                  ),
                  onPressed: () async {
                    await uploadCastingDetails();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const casting_home_page(),
                      ),
                    );
                  },
                  child: Text(
                    "Upload",
                    style: GoogleFonts.fugazOne(
                      color: const Color.fromARGB(255, 46, 53, 62),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 229, 206, 177),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 200,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty || value.length != 10) {
                              return 'Enter a valid phone number';
                            }
                          },
                          controller: whatsappController,
                          decoration:
                              InputDecoration(hintText: 'Whatsapp Number'),
                        )),
                    SizedBox(
                        width: 200,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: instagramController,
                          decoration: InputDecoration(hintText: 'Instagram ID'),
                        )),
                    SizedBox(
                        width: 200,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            String? _validateemail(value) {
                              if (value!.isEmpty) {
                                return 'Please enter an email';
                              }
                              RegExp emailRegExp = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                              if (!emailRegExp.hasMatch(value)) {
                                return 'Please enter a valid Email';
                              }
                              return null;
                            }
                          },
                          controller: emailController,
                          decoration: InputDecoration(hintText: 'Email ID'),
                        )),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Icon(
                        Icons.cloud_upload,
                        color: Color.fromARGB(255, 46, 53, 62),
                        size: 120,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        await _pickImageFromGallery();
                        if (file != null) {
                          Fluttertoast.showToast(
                            msg: "File selected: ${file!.path}",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      child: Text(
                        'Upload a file',
                        style: GoogleFonts.fugazOne(
                          color: const Color(0xff2D3037),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
