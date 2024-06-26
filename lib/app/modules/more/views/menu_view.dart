import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MenuView extends GetView {
  MenuView({
    required this.to,
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String title;
  final String icon;
  dynamic to;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(to),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 22, 98, 168),
                offset: Offset(2.0, 2.0),
                spreadRadius: 1.0),
            BoxShadow(
                color: Color.fromARGB(255, 245, 245, 245),
                offset: Offset(-1.0, -1.0),
                spreadRadius: 1.0)
          ],
        ),
        margin: EdgeInsets.all(10),
        width: Get.width * 0.4,
        child: Column(
          children: [
            Image.asset(icon),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.breeSerif(
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
