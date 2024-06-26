import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/event_controller.dart';
import 'event_data_view.dart';

class EventView extends GetView<EventController> {
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
          'Event',
          style: GoogleFonts.breeSerif(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          height: Get.height * 1,
          color: Color.fromARGB(255, 242, 242, 246),
          child: EventDataView(controller: controller, context: context),
        ),
      ),
    );
  }
}
