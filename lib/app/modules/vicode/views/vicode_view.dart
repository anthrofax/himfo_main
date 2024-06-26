import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/vicode/views/list_channel.dart';
import '../controllers/vicode_controller.dart';

class VicodeView extends GetView<VicodeController> {
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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1C1C1E),
          ),
        ),
        title: Text('Vicode',
            style: GoogleFonts.breeSerif(
              fontSize: 22.0,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: Container(
        child: ListChannel(),
      ),
    );
  }
}
