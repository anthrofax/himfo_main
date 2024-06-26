import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EventController extends GetxController {
  Future<PostgrestResponse<dynamic>> getEvent() async {
    PostgrestResponse snapshot = await Supabase.instance.client
        .from('event')
        .select()
        .order('created_at', ascending: false)
        .execute();
    return snapshot;
  }

  @override
  void onInit() {
    super.onInit();
  }

  getAlert(context, String title, String subtitle, String isi) {
    Alert(
      context: context,
      title: title,
      content: Column(
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Text(
            subtitle,
            style: GoogleFonts.sourceSansPro(
              textStyle: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            isi.replaceAll(r'\n', '\n'),
            style: GoogleFonts.sourceSansPro(
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
}
