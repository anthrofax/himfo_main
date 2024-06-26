import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/task/views/data_task.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
            color: Color.fromARGB(255, 39, 137, 216),
          ),
        ),
        title: Text(
          'Task',
          style: GoogleFonts.breeSerif(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 228, 228, 233),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 39, 137, 216),
                borderRadius: new BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    controller.formattedDate2,
                    style: GoogleFonts.breeSerif(
                      textStyle: TextStyle(
                          color: Color.fromARGB(255, 193, 228, 40),
                          fontSize: 30),
                    ),
                  ),
                  Text(
                    controller.formattedDate,
                    style: GoogleFonts.breeSerif(
                      textStyle: TextStyle(
                          color: Color.fromARGB(255, 193, 228, 40),
                          fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: DataTask()),
          ],
        ),
      ),
    );
  }
}
