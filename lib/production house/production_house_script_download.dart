// import 'dart:developer';

// import 'package:cinebyte_network_application/production%20house/create_schedules_page.dart';
// import 'package:cinebyte_network_application/util/appcustomattributes.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// class production_house_script_download_page extends StatefulWidget {
//   final scripts;

//   production_house_script_download_page({
//     Key? key,
//     required this.scripts,
//   }) : super(key: key);

//   @override
//   State<production_house_script_download_page> createState() =>
//       _production_house_script_download_pageState();
// }

// class _production_house_script_download_pageState
//     extends State<production_house_script_download_page> {
//   // Reference storage =
//   //     FirebaseStorage.instance.ref().child('scriptsfiles').getData()

//   String? localFilePath;
//   @override

//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.9;
//     double height = MediaQuery.of(context).size.height * 0.8;
//     return Scaffold(
//       appBar: Custom_appbar_real(title: 'Scripts/Synopsys'),
//       body: Center(
//         child: Text(widget.scripts['scriptdescription']),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               // log('--------------------------${widget.scripts['scriptfile']}---------------------------');
//               Navigator.of(context).pop();
//             },
//             backgroundColor: const Color.fromARGB(255, 234, 210, 178),
//             child: const Icon(Icons.close),
//           ),
//           const SizedBox(
//             width: 50,
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               // Navigator.of(context).push(MaterialPageRoute(
//               //   builder: (context) => create_schedules_page(
//               //     // username: widget.users,
//               //     scriptdata: widget.scripts,
//               //   ),
//               // ));
//             },
//             backgroundColor: const Color.fromARGB(255, 234, 210, 178),
//             child: const Icon(Icons.check),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class production_house_script_download_page extends StatefulWidget {
  final scripts;
  const production_house_script_download_page({
    super.key,
    required this.scripts,
  });

  @override
  State<production_house_script_download_page> createState() =>
      _production_house_script_download_pageState();
}

class _production_house_script_download_pageState
    extends State<production_house_script_download_page> {
  String _pdfUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_appbar_real(title: 'Scripts/Synopsys'),
      // body: SfPdfViewer.network(
      //     'https://firebasestorage.googleapis.com/v0/b/cinebyte-network.appspot.com/o/scriptsfiles%2Fscript_1719549786351.pdf?alt=media&token=910068d6-e94b-4659-b9b6-e6f437b0aea7'),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'SCRIPT NAME :${widget.scripts['scriptname']}',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'SCRIPT DISCRIPTION :${widget.scripts['scriptdescription']}',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Row(
                            children: [
                              IC
                              ext('DOWLOAD PDF'),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              // log('--------------------------${widget.scripts['scriptfile']}---------------------------');
              Navigator.of(context).pop();
            },
            backgroundColor: const Color.fromARGB(255, 234, 210, 178),
            child: const Icon(Icons.close),
          ),
          const SizedBox(
            width: 50,
          ),
          FloatingActionButton(
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => create_schedules_page(
              //     // username: widget.users,
              //     scriptdata: widget.scripts,
              //   ),
              // ));
            },
            backgroundColor: const Color.fromARGB(255, 234, 210, 178),
            child: const Icon(Icons.check),
          ),
        ],
      ),
    );
  }
}
