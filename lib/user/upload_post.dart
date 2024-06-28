import 'dart:io';
import 'package:cinebyte_network_application/firebase/galleryservice.dart';
import 'package:cinebyte_network_application/model/gallery_model.dart';
import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart'; // Add this line for video preview

class UploadPostPage extends StatefulWidget {
  const UploadPostPage({super.key});

  @override
  State<UploadPostPage> createState() => _UploadPostPageState();
}

class _UploadPostPageState extends State<UploadPostPage> {
  final TextEditingController postnamecontroller = TextEditingController();
  final TextEditingController postdescriptioncontroller =
      TextEditingController();
  final GlobalKey<FormState> _postkey = GlobalKey<FormState>();
  File? selectedFile;
  VideoPlayerController?
      _videoPlayerController; // Add this line for video preview

  @override
  void dispose() {
    postnamecontroller.dispose();
    postdescriptioncontroller.dispose();
    _videoPlayerController?.dispose(); // Dispose the video player controller
    super.dispose();
  }

  Future<void> selectMediaFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: [
        'jpg', 'jpeg', 'png', 'gif', // Image extensions
        'mp4', 'avi', 'mov', 'wmv' // Video extensions
      ],
    );
    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);

        // Initialize video player if the selected file is a video
        if (['mp4', 'avi', 'mov', 'wmv']
            .contains(result.files.single.extension)) {
          _videoPlayerController = VideoPlayerController.file(selectedFile!)
            ..initialize().then((_) {
              setState(() {}); // Ensure the video preview is shown
              _videoPlayerController!.play(); // Auto-play the video
            });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.97;
    double containerwidth = MediaQuery.of(context).size.width * 0.90;
    double height = MediaQuery.of(context).size.height * 0.7;
    double containerheight = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
      appBar:  Custom_appbar_real(title: 'Post Upload'),
      body: SingleChildScrollView(
        child: Form(
          key: _postkey,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
                  child: App_Custom_button(
                    textcolor: const Color.fromARGB(255, 33, 33, 33),
                    hsize: 30,
                    fontsize: 15,
                    onPressed: () {
                      if (_postkey.currentState!.validate()) {
                        addpost();
                      }
                    },
                    wsize: 70,
                    text: 'Upload',
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter post name';
                          }
                          return null;
                        },
                        controller: postnamecontroller,
                        decoration: InputDecoration(
                          hintText: 'Post Name',
                          hintStyle: GoogleFonts.fugazOne(
                            color: const Color.fromARGB(155, 113, 113, 113),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: TextFormField(
                        controller: postdescriptioncontroller,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          hintStyle: GoogleFonts.fugazOne(
                            color: const Color.fromARGB(155, 113, 113, 113),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      decoration: const BoxDecoration(),
                      height: containerheight,
                      width: containerwidth,
                      child: selectedFile == null
                          ? Material(
                              color: const Color.fromARGB(255, 247, 212, 162),
                              borderRadius: BorderRadius.circular(20),
                              child: IconButton(
                                onPressed: selectMediaFile,
                                icon: const Icon(Icons.image, size: 100),
                              ),
                            )
                          : _buildPreview(),
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

  Widget _buildPreview() {
    if (['jpg', 'jpeg', 'png', 'gif', 'mp4', 'avi', 'mov', 'wmv']
        .contains(selectedFile!.path.split('.').last)) {
      return Image.file(selectedFile!);
    } else if (_videoPlayerController != null &&
        _videoPlayerController!.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _videoPlayerController!.value.aspectRatio,
        child: VideoPlayer(_videoPlayerController!),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  addpost() async {
    try {
      String postId = const Uuid().v1();
      String userid = FirebaseAuth.instance.currentUser!.uid;
      String fileExtension = selectedFile!.path.split('.').last;
      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('posts')
          .child('$postId.$fileExtension');

      UploadTask uploadTask = storageRef.putFile(selectedFile!);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
      String fileUrl = await taskSnapshot.ref.getDownloadURL();
      galleryModel _gallerymodel = galleryModel(
        postid: postId,
        postname: postnamecontroller.text,
        postdescription: postdescriptioncontroller.text,
        postdata: fileUrl,
        userid: userid,
      );
      galleryService _galleryservice = galleryService();
      await _galleryservice.createpost(_gallerymodel);
      setState(() {
        selectedFile = null;
        _videoPlayerController = null;
        postnamecontroller.clear();
        postdescriptioncontroller.clear();
      });
      Fluttertoast.showToast(
        msg: "Post uploaded",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "Upload failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
