import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/hicode/views/list_coding_view.dart';

import '../controllers/hicode_controller.dart';

class HicodeView extends GetView<HicodeController> {
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
          'Hicode',
          style: GoogleFonts.breeSerif(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF1C1C1E),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ListCoding(
              img: 'assets/icon/c.png',
              title: "C++",
            ),
            ListCoding(
              img: 'assets/icon/python.png',
              title: "PYTHON",
            ),
            ListCoding(
              img: 'assets/icon/html.png',
              title: "HTML",
            ),
            ListCoding(
              img: 'assets/icon/css3.png',
              title: "CSS",
            ),
            ListCoding(
              img: 'assets/icon/javascript.png',
              title: "JAVASCRIPT",
            ),
            ListCoding(
              img: 'assets/icon/java.png',
              title: "JAVA",
            ),
            ListCoding(
              img: 'assets/icon/mysql.png',
              title: "MYSQL",
            ),
            ListCoding(
              img: 'assets/icon/php.png',
              title: "PHP",
            ),
          ],
        ),
      ),
    );
  }
}
