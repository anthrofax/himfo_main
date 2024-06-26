import 'dart:convert';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HimtikaController extends GetxController {
  Future<List> getPendidik() async {
    // String email = "2110631170085@student.unsika.ac.id";
    var response =
        await Supabase.instance.client.from('pendidik').select().execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    update();
    return dataList;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
