import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class user_casting_calls_clicked_page extends StatefulWidget {
  final String? image;
  const user_casting_calls_clicked_page({super.key, this.image});

  @override
  State<user_casting_calls_clicked_page> createState() =>
      _user_casting_calls_clicked_pageState();
}

class _user_casting_calls_clicked_pageState
    extends State<user_casting_calls_clicked_page> {
  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }

  void _shareOnWhatsApp() {
    final url = 'https://wa.me/?text=${Uri.encodeComponent('Check out this casting call! ${widget.image}')}';
    _launchURL(url);
  }

  void _shareOnInstagram() {
    final url = 'https://www.instagram.com/?url=${Uri.encodeComponent(widget.image ?? '')}';
    _launchURL(url);
  }

  void _shareOnGmail() {
    final url = 'mailto:?subject=Casting Call&body=Check out this casting call! ${widget.image}';
    _launchURL(url);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height * 0.7;

    return Scaffold(
      appBar: Custom_appbar_real(title: 'Casting Call'),
      body: Column(
        children: [
          Center(
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 229, 206, 177),
                borderRadius: BorderRadius.circular(25),
              ),
              clipBehavior: Clip.hardEdge,
              child: widget.image != null
                  ? Image.network(
                      widget.image!,
                      fit: BoxFit.cover,
                    )
                  : Container(),
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
                backgroundColor: Color(0xff2D3037),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                builder: (context) {
                  return Container(
                    height: 150,
                    width: width,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            'Click below to share',
                            style: GoogleFonts.fugazOne(
                              color: Color.fromARGB(255, 229, 206, 177),
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: _shareOnWhatsApp,
                              icon: Image.asset('images/whatsapp1.png'),
                            ),
                            IconButton(
                              onPressed: _shareOnInstagram,
                              icon: Image.asset(
                                'images/instagram.png',
                                scale: 1,
                              ),
                            ),
                            IconButton(
                              onPressed: _shareOnGmail,
                              icon: Image.asset('images/gmail.png'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
