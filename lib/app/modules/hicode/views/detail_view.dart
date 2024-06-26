import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailView extends GetView {
  DetailView({
    required this.title,
    required this.html,
    Key? key,
  }) : super(key: key);

  final String title;
  final String html;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1C1C1E),
          ),
        ),
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
        title: Text(
          title,
          style: GoogleFonts.breeSerif(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF1C1C1E),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 15),
          child: Html(
            data: """${html}""",
            style: {
              "h1": Style(
                fontFamily: 'sourceSansPro',
                color: Color.fromARGB(250, 235, 235, 245),
              ),
              "p": Style(
                fontFamily: 'sourceSansPro',
                color: Color.fromARGB(255, 235, 235, 245),
                textDecoration: TextDecoration.none,
              ),
              "#footer": Style(
                display: Display.BLOCK,
                whiteSpace: WhiteSpace.PRE,
                backgroundColor: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            },
          ),
        ),
      ),
    );
  }
}
