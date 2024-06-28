// import 'package:cinebyte_network_application/util/appcustomattributes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';

// class single_post_view_page extends StatefulWidget {
//    String imageUrl;
//   single_post_view_page({super.key, required this.imageUrl});

//   @override
//   State<single_post_view_page> createState() => _single_post_view_pageState();
// }

// class _single_post_view_pageState extends State<single_post_view_page> {

//   @override
//   Widget build(BuildContext context) {

//     bool? ischecked = false;
//     // double width = MediaQuery.of(context).size.width * 0.97;
//     double height = MediaQuery.of(context).size.height * 0.6;
//     return Scaffold(
//       appBar: const Custom_appbar_real(title: 'Gallery'),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 50,
//           ),
//           ListTile(
//             leading: Text(
//               'Post',
//               style: GoogleFonts.fugazOne(color: Colors.white, fontSize: 18),
//             ),
//             trailing: IconButton(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                             title: const Text('post'),
//                             content: TextFormField(
//                               decoration:
//                                   const InputDecoration(hintText: 'Edit name'),
//                             ),
//                             actions: [
//                               const Text('Delete post'),
//                               const Icon(Icons.delete),
//                               TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   child: const Text('Submit'))
//                             ],
//                           ));
//                 },
//                 icon: const Icon(
//                   Icons.more_vert,
//                   color: Colors.white,
//                 )),
//           ),
//           SizedBox(
//             height: height,
//             width: double.infinity,
//             child: Image.network(
//               imageUrl,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Row(
//             children: [
//               IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.favorite_outline,
//                     color: Colors.white,
//                     size: 30,
//                   )),
//               IconButton(
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       isScrollControlled: true,
//                       builder: (context) => Container(
//                         decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 34, 37, 45),
//                             borderRadius: BorderRadius.circular(20)),
//                         height: 500, // Adjust height as needed

//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(20),
//                               child: TextFormField(
//                                 decoration: const InputDecoration(
//                                     labelText: 'Add your comment...'),
//                               ),
//                             ),
//                             // Divider(thickness: 2,color: Colors.black,),

//                             Expanded(
//                               child: ListView.builder(
//                                   itemCount: 5,
//                                   itemBuilder: (context, index) {
//                                     return ListTile(
//                                       title: Text(
//                                         'comment  ${index + 1}',
//                                         style: GoogleFonts.fugazOne(
//                                             color: Colors.white),
//                                       ),
//                                       trailing:
//                                           const Icon(Icons.favorite_outline),
//                                     );
//                                   }),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                   icon: const Icon(
//                     Icons.comment,
//                     color: Colors.white,
//                     size: 30,
//                   )),
//               IconButton(
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       isScrollControlled: true,
//                       builder: (context) => Container(
//                         decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 34, 37, 45),
//                             borderRadius: BorderRadius.circular(20)),
//                         height: 500, // Adjust height as needed

//                         child: Column(
//                           children: [
//                             Padding(
//                                 padding: const EdgeInsets.all(20),
//                                 child: Text(
//                                   'Share to',
//                                   style:
//                                       GoogleFonts.fugazOne(color: Colors.white),
//                                 )),
//                             // Divider(thickness: 2,color: Colors.black,),

//                             Expanded(
//                               child: ListView.builder(
//                                   itemCount: 5,
//                                   itemBuilder: (context, index) {
//                                     return ListTile(
//                                       leading: const CircleAvatar(),
//                                       title: Text(
//                                         'user  ${index + 1}',
//                                         style: GoogleFonts.fugazOne(
//                                             color: Colors.white),
//                                       ),
//                                       trailing: Checkbox(
//                                           value: ischecked,
//                                           activeColor: Colors.amber[200],
//                                           tristate: true,
//                                           onChanged: (bool? newbool) {
//                                             setState(() {
//                                               ischecked = newbool;
//                                             });
//                                           }),
//                                     );
//                                   }),
//                             ),
//                             TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   'Send',
//                                   style:
//                                       GoogleFonts.fugazOne(color: Colors.white),
//                                 ))
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                   icon: const Icon(
//                     Icons.share,
//                     color: Colors.white,
//                     size: 30,
//                   )),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: 20,
//               ),
//               Text('ddddddddd',
//                   style: GoogleFonts.fugazOne(color: Colors.white)),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// // class commentbox extends StatefulWidget {
// //   const commentbox({super.key});

// //   @override
// //   State<commentbox> createState() => _commentboxState();
// // }

// // class _commentboxState extends State<commentbox> {
// //   @override
// //   Widget build(BuildContext context) {

// //     }

// //   }
// // }
// // Widget _buildCommentSheet(ScrollController controller) {
// //   return Container(
// //     color: Colors.yellow,
// //     child: ListView(
// //       // Allow scrolling content
// //       controller: controller,
// //       children: [
// //         // Your comment sheet content here (e.g., Text field, Submit button)
// //         ListTile(title: Text('Comment 1')),
// //         ListTile(title: Text('Comment 2')),
// //         // ... more content
// //       ],
// //     ),
// //   );
// // }

import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class single_post_view_page extends StatefulWidget {
  final String? imageUrl;
  final String? postid;
  single_post_view_page({super.key, this.postid, this.imageUrl});

  @override
  State<single_post_view_page> createState() => _single_post_view_pageState();
}

class _single_post_view_pageState extends State<single_post_view_page> {
  @override
  Widget build(BuildContext context) {
    bool? isChecked = false;
    final TextEditingController _commentcontroller = TextEditingController();
    Future<void> updateLikeStatus(bool likestatus) async {
      if (widget.postid != null && widget.postid!.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('gallery')
            .doc(widget.postid)
            .update({'likedornot': likestatus});
      }
    }

    Future<void> addcomments(String comments) async {
      if (widget.postid != null && widget.postid!.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('gallery')
            .doc(widget.postid)
            .update({
          'comments': FieldValue.arrayUnion([comments]),
        });
        _commentcontroller.clear();
      }
    }

    double height = MediaQuery.of(context).size.height * 0.6;
    return Scaffold(
      appBar:  Custom_appbar_real(title: 'Gallery'),
      body: Column(
        children: [
          const SizedBox(height: 50),
          ListTile(
            leading: Text(
              'Post',
              style: GoogleFonts.fugazOne(color: Colors.white, fontSize: 18),
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Post'),
                    content: TextFormField(
                      decoration: const InputDecoration(hintText: 'Edit name'),
                    ),
                    actions: [
                      const Text('Delete post'),
                      const Icon(Icons.delete),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.more_vert, color: Colors.white),
            ),
          ),
          SizedBox(
            height: height,
            width: double.infinity,
            child: Image.network(
              widget.imageUrl ?? '',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isChecked = !isChecked!;
                    // updateLikeStatus(isChecked!);
                  });
                },
                icon: Icon(
                  isChecked! ? Icons.favorite : Icons.favorite_outline,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 37, 45),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 500, // Adjust height as needed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: TextFormField(style: GoogleFonts.fugazOne(color:Colors.white),
                              controller: _commentcontroller,
                              decoration:  InputDecoration(
                                labelText: 'Add your comment...',labelStyle: GoogleFonts.fugazOne(color:Colors.white)
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    'comment  ${index + 1}',
                                    style: GoogleFonts.fugazOne(
                                      color: Colors.white,
                                    ),
                                  ),
                                  trailing: const Icon(Icons.favorite_outline),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white)),
                                onPressed: () {},
                                child: Text(
                                  'Add Comment',
                                  style:
                                      GoogleFonts.fugazOne(color: Colors.black),
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.comment,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  // addcomments(_commentcontroller.text);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 34, 37, 45),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 500, // Adjust height as needed
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Share to',
                              style: GoogleFonts.fugazOne(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const CircleAvatar(),
                                  title: Text(
                                    'user  ${index + 1}',
                                    style: GoogleFonts.fugazOne(
                                      color: Colors.white,
                                    ),
                                  ),
                                  trailing: Checkbox(
                                    value: isChecked,
                                    activeColor: Colors.amber[200],
                                    tristate: true,
                                    onChanged: (bool? newBool) {
                                      isChecked = newBool;
                                      (context as Element)
                                          .markNeedsBuild(); // Manually triggers build
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Send',
                              style: GoogleFonts.fugazOne(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 20),
              Text(
                'Caption',
                style: GoogleFonts.fugazOne(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
