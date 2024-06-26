import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TaskController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController date = TextEditingController();
  final formatDate = new DateFormat('HH:mm - dd MMM yyyy');
  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('dd MMM yyyy');
  static final DateFormat formatter2 = DateFormat('EEEE');
  final String formattedDate = formatter.format(now);
  final String formattedDate2 = formatter2.format(now);
  TextEditingController nama = new TextEditingController();
  Future<List> getTask() async {
    // String email = "2110631170085@student.unsika.ac.id";
    final box = GetStorage();
    String email = box.read("email");
    var response = await Supabase.instance.client
        .from('task')
        .select()
        .eq('email', email)
        .execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    update();
    return dataList;
  }

  deleteTask(context, int id) async {
    // String email = "2110631170085@student.unsika.ac.id";
    Supabase.instance.client.from('task').delete().match({'id': id}).execute();

    Navigator.pop(context);
    RefreshProgressIndicator();
    // Get.toNamed('task');
  }

  addTask(context, String title, String date, String note, String email) async {
    Supabase.instance.client.from('task').insert([
      {'title': title, 'date': date, 'note': note, 'email': email}
    ]).execute();

    Navigator.of(context);
    update();
    Alert(
      context: context,
      type: AlertType.success,
      title: "success",
      buttons: [
        DialogButton(
          child: Text(
            "back",
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

  final id = 0.obs;

  void refreshData() {
    id.value = id.value++;
  }

  FutureOr onGoBack(dynamic value) {
    refreshData();
    update();
    super.onInit();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
