import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProkerController extends GetxController {
  Future<List> getProker() async {
    // String email = "2110631170085@student.unsika.ac.id";
    var response =
        await Supabase.instance.client.from('proker').select().execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    return dataList;
  }

  getAlert(context, String name, String divisi, String detail) {
    Alert(
      context: context,
      title: name,
      content: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Text(
            divisi,
            style: GoogleFonts.notoSans(
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            detail,
            style: GoogleFonts.notoSans(
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
