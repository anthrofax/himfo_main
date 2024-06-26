import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuHimtikaView extends GetView {
  MenuHimtikaView({
    required this.to,
    required this.title,
    required this.icon,
    required this.color,
    Key? key,
  }) : super(key: key);

  final String title;
  final String icon;
  final dynamic to;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(to);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
                offset: Offset(1.0, 1.0),
                spreadRadius: 1.0),
            BoxShadow(
                color: Colors.white,
                blurRadius: 3.0,
                offset: Offset(-1.0, -1.0),
                spreadRadius: 1.0)
          ],
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              height: 130,
              width: 130,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(),
                child: Image.asset(icon),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10.0)),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.sourceSansPro(
                    fontSize: 16.0, color: color, fontWeight: FontWeight.bold),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: color,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
