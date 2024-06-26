import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class KontakController extends GetxController {
  late TextEditingController nama = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController subject = TextEditingController();
  late TextEditingController message = TextEditingController();

  addKontak(context, String name, String email, String subject,
      String message) async {
    Supabase.instance.client.from('kontak_kami').insert([
      {'name': name, 'email': email, 'subject': subject, 'message': message}
    ]).execute();

    Navigator.of(context);
    Alert(
      context: context,
      type: AlertType.success,
      title: "Terima Kasih",
      buttons: [
        DialogButton(
          child: Text(
            "ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}
}
