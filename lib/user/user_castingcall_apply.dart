import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class user_casting_calls_clicked_page extends StatefulWidget {
  final String? image;
  final String? whatsappNumber;
  final String? instaID;
  final String? emailID;
  const user_casting_calls_clicked_page(
      {super.key, this.image, this.emailID, this.instaID, this.whatsappNumber});

  @override
  State<user_casting_calls_clicked_page> createState() =>
      _user_casting_calls_clicked_pageState();
}

class _user_casting_calls_clicked_pageState
    extends State<user_casting_calls_clicked_page> {
  _launchWhatsapp() async {
    var whatsapp = widget.whatsappNumber;
    var whatsappAndroid =
        Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
  }

  _launchInstagram() async {
    final nativeUrl = 'instagram://user?username=${widget.emailID}';
    var webUrl = "https://www.instagram.com/${widget.emailID}";

    try {
      await launchUrlString(nativeUrl!, mode: LaunchMode.externalApplication);
    } catch (e) {
      print(e);
      await launchUrlString(webUrl, mode: LaunchMode.platformDefault);
    }
  }

  _sendMail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: widget.emailID, // This should be the recipient's email address
      // query: 'subject=Sample Subject&body=This is a sample email body', // Optional: Add subject and body if needed
    );

    var uriString = params.toString();
    if (await canLaunch(uriString)) {
      await launch(uriString);
    } else {
      throw 'Could not launch $uriString';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.7;

    return Scaffold(
      appBar: Custom_appbar_real(title: 'casting call'),
      body: Column(
        children: [
          Center(
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 229, 206, 177),
                  borderRadius: BorderRadius.circular(25)),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                '${widget.image}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          App_Custom_button(
            textcolor: Color.fromARGB(255, 46, 53, 62),
            hsize: 30,
            wsize: 100,
            text: 'Apply',
            fontsize: 15,
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: (Color(0xff2D3037)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
                  builder: ((context) {
                    return Container(
                      height: 150,
                      width: width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              'Click below to send',
                              style: GoogleFonts.fugazOne(
                                  color: (Color.fromARGB(255, 229, 206, 177)),
                                  fontSize: 18),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _launchWhatsapp();
                                  },
                                  icon: Image.asset('images/whatsapp1.png')),
                              IconButton(
                                  onPressed: () {
                                    _launchInstagram();
                                  },
                                  icon: Image.asset(
                                    'images/instagram.png',
                                    scale: 1,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    _sendMail();
                                  },
                                  icon: Image.asset('images/gmail.png'))
                            ],
                          )
                        ],
                      ),
                    );
                  }));
            },
          )
        ],
      ),
    );
  }
}
