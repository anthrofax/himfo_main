import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewDetail extends StatefulWidget {
  final String book;
  final String title;

  PdfViewDetail({required this.book, required this.title});

  @override
  _PdfViewDetailState createState() => _PdfViewDetailState();
}

class _PdfViewDetailState extends State<PdfViewDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 25,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Color(0xFF398AE5),
        elevation: 0,
        title: AutoSizeText(
          widget.title,
          style: GoogleFonts.breeSerif(textStyle: TextStyle(fontSize: 20)),
          maxLines: 1,
        ),
      ),
      body: SfPdfViewer.network(widget.book),
    );
  }
}
