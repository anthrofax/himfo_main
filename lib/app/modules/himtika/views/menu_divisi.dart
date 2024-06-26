import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/home/views/detail_divisi_view.dart';

class MenuDivisi extends GetView {
  MenuDivisi({
    required this.title,
    required this.title2,
    required this.icon,
    required this.codeDivisi,
    Key? key,
  }) : super(key: key);
  late final title;
  late final title2;
  late final icon;
  late final codeDivisi;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Get.to(DetailDivisiView(title: title2, codeDivisi: codeDivisi)),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        margin: EdgeInsets.only(left: 5, bottom: 5, right: 5),
        child: Container(
          width: 230,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 39, 137, 216),
                Color(0XFF1CB5E0),
              ],
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                title,
                style: GoogleFonts.sourceSansPro(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Container(
                height: 120,
                width: 120,
                child: Image.asset(
                  icon,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
