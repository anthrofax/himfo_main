import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/hicode/views/part_coding_view.dart';

class ListCoding extends GetView {
  ListCoding({
    required this.img,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(PartCodingView(
        title: title,
      )),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          color: Color.fromARGB(80, 112, 112, 112),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(214, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
                width: 120,
              ),
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
