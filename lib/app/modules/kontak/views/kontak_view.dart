import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/kontak_controller.dart';

class KontakView extends GetView<KontakController> {
  KontakController controller = KontakController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height * 1,
        color: Color.fromARGB(255, 242, 242, 246),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Text(
                    "Kontak kami",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      size: 36,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                controller: controller.nama,
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Name",
                  // hintText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                controller: controller.email,
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Email",
                  // hintText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextFormField(
                controller: controller.subject,
                cursorColor: Theme.of(context).cursorColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Subject",
                  // hintText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  controller: controller.message,
                  keyboardType: TextInputType.multiline,
                  minLines: 1, //Normal textInputField will be displayed
                  maxLines: 7,
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Message",
                    // hintText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          String name = controller.nama.text;
          String email = controller.email.text;
          String subject = controller.subject.text;
          String message = controller.message.text;

          if (name.isEmpty ||
              email.isEmail ||
              subject.isEmpty ||
              message.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Terjadi Kesalahan!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ));
          } else {
            controller.addKontak(context, name, email, subject, message);
            controller.nama.clear();
            controller.email.clear();
            controller.subject.clear();
            controller.message.clear();
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        icon: Icon(Icons.send_rounded),
        label: Text("Send"),
        enableFeedback: true,
      ),
    );
  }
}
