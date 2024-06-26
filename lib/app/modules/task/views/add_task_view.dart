import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/task_controller.dart';

class AddTaskView extends StatefulWidget {
  AddTaskView({Key? key}) : super(key: key);

  @override
  State<AddTaskView> createState() => _AddTaskView();
}

class _AddTaskView extends State<AddTaskView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TaskController controller = TaskController();
    Widget _buildAddBtn() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(vertical: 25.0),
        child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            final box = GetStorage();
            String email = box.read("email");
            controller.addTask(context, controller.title.text,
                controller.date.text, controller.note.text, email);
            setState(() {});
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Color(0xFF398AE5),
          child: Text(
            'Add',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      );
    }

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
        title: Text("Add Task"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 39, 137, 216),
          ),
        ),
      ),
      body: Container(
        color: Colors.white60,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: controller.title,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        border: InputBorder.none,
                        hintText: 'Title',
                        hintStyle: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextFormField(
                      controller: controller.note,
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        hintText: 'Note',
                        hintStyle: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2022, 1, 1, 00, 00),
                        maxTime: DateTime(2030, 1, 1, 00, 00),
                        onChanged: (date) {
                      print('change $date');

                      // controller.date.text =
                      //     controller.formatDate.format(date);
                    }, onConfirm: (date) {
                      print('confirm $date');
                      controller.date.text = controller.formatDate.format(date);
                    }, currentTime: DateTime.now(), locale: LocaleType.id),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextFormField(
                        controller: controller.date,
                        enabled: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.transparent,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.date_range_outlined,
                            color: Color.fromARGB(199, 18, 18, 224),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          hintText: 'Date',
                          hintStyle: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _buildAddBtn()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
