import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ItemMenuView extends GetView {
  ItemMenuView({
    required this.to,
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String title;
  final String icon;
  String to;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(to),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 218, 219, 220),
                  offset: Offset(2.0, 2.0),
                  spreadRadius: 1.0,
                  blurRadius: 7.0,
                ),
                BoxShadow(
                    color: Color.fromARGB(255, 245, 245, 245),
                    offset: Offset(-1.0, -1.0),
                    spreadRadius: 1.0)
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              color: Colors.white,

              // gradient: LinearGradient(
              //   begin: Alignment.centerLeft,
              //   end: Alignment.centerRight,
              //   colors: [
              //     Color(0xFF2193b0),
              //     Color(0xFF6dd5ed),
              //   ],
              // ),
            ),
            padding: EdgeInsets.all(10),
            width: 60,
            height: 60,
            child: Image.asset(
              icon,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: GoogleFonts.sourceSansPro(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0XFF191919),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
