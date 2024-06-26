import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VicodeController extends GetxController {
  Future<List> getPlaylist() async {
    // String email = "2110631170085@student.unsika.ac.id";
    var response =
        await Supabase.instance.client.from('vicode').select().execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    return dataList;
  }

  Future<List> getEvent() async {
    // String email = "2110631170085@student.unsika.ac.id";
    var response = await Supabase.instance.client
        .from('video')
        .select()
        .limit(3)
        .order("created_at", ascending: false)
        .execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    return dataList;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
  }
}
