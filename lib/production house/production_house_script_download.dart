import 'package:cinebyte_network_application/util/appcustomattributes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';

class production_house_script_download_page extends StatefulWidget {
  final scripts;
  const production_house_script_download_page({super.key, this.scripts});

  @override
  State<production_house_script_download_page> createState() =>
      _production_house_script_download_pageState();
}

class _production_house_script_download_pageState
    extends State<production_house_script_download_page> {
  late PDFViewControllerPinch pdfViewControllerPinch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_appbar_real(title: 'Scripts'),
      body: Text(
        '${widget.scripts['scriptfile']}',
        style: GoogleFonts.fugazOne(color: Colors.white),
      ),
    );
  }
}
