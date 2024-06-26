import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 39, 137, 216),
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
          'About Himfo',
          style: GoogleFonts.breeSerif(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 242, 242, 246),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: <Widget>[
            Center(
              child: Text('HIMFO V1.0',
                  style:
                      GoogleFonts.poppins(fontSize: 18.0, color: Colors.black)),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 250,
              width: double.infinity,
              child: Image.asset('assets/img/logo_himtika.png'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Text(
                "Aplikasi ini bernama HIMFO (HIMTIKA Mobile Information) sesuai namanya bahwasanya aplikasi ini mempunyai tujuan memberikan informasi apapun yang berkaitan dengan teknik informatika UNSIKA.",
                style: GoogleFonts.poppins(),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
