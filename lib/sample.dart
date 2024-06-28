// // import 'package:cinebyte_network_application/get_started_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// // import 'package:google_fonts/google_fonts.dart';

// class sample extends StatefulWidget {
//   const sample({super.key});

//   @override
//   State<sample> createState() => _sampleState();
//   int _currentSelectedIndex = 0;
// }

// class _sampleState extends State<sample> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (newindex) {
//           setState(() {
            
//           });
//         },
//         items: [const
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.more_vert_outlined), label: 'more')
//         ],
//         backgroundColor: Colors.amberAccent[100],
//       ),
//     );
//   }

//   Future<void> ShowBottomSheet(BuildContext ctx) async {
//     showModalBottomSheet(
//         context: ctx,
//         builder: (ctx1) {
//           return Container(
//             width: double.infinity,
//             height: 500,
//             color: Colors.yellow[400],
//             child: ListView(
//               children: [
//                 Text('text'),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.of(ctx1).pop();
//                     },
//                     child: Text('close'))
//               ],
//             ),
//           );
//         });
//   }
// }

