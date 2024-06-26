import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/task/controllers/task_controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'add_task_view.dart';

class DataTask extends StatefulWidget {
  DataTask({Key? key}) : super(key: key);

  @override
  State<DataTask> createState() => _DataTaskState();
}

class _DataTaskState extends State<DataTask> {
  TaskController controller = TaskController();

  @override
  void initState() {
    super.initState();
    setState(() {
      // code here to refresh data
      controller.getTask();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 228, 228, 233),
        child: FutureBuilder<List>(
          future: controller.getTask(),
          builder: (contextBuilder, snapshot) {
            List? data = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: Get.height * 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor, // Red
                      ),
                    ),
                  ],
                ),
              );
            } else {
              if (data!.isEmpty)
                return Center(
                  child: Text(
                    "Task Kosong",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              return ListView.builder(
                // ignore: unnecessary_null_comparison
                itemCount: data.length == null ? 0 : snapshot.data!.length,
                itemBuilder: (contextItem, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(13.0),
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
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]['date'],
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          data[index]['title'],
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        Text(
                          data[index]['note'],
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color.fromARGB(255, 184, 7, 7),
                                ),
                              ),
                              onPressed: () {
                                setState(() {});
                                Alert(
                                  context: context,
                                  type: AlertType.warning,
                                  title: "Hapus Task?",
                                  desc: "title: ${data[index]['title']}",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "hapus",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () {
                                        controller.deleteTask(context,
                                            snapshot.data![index]['id']);
                                        setState(() {});
                                        ;
                                      },
                                      color: Color.fromARGB(255, 158, 25, 25),
                                      radius: BorderRadius.circular(0.0),
                                    ),
                                  ],
                                ).show();
                              },
                              child: Text(
                                "hapus",
                                style: GoogleFonts.breeSerif(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddTaskView())).then((_) {
            // This block runs when you have returned back from screen 2.
            setState(() {
              // code here to refresh data
              // controller.getTask();
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
