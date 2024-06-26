import 'dart:convert';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HicodeController extends GetxController {
  Future<List> getHicode(String pemrograman) async {
    // String email = "2110631170085@student.unsika.ac.id";
    var response = await Supabase.instance.client
        .from('hicode')
        .select()
        .eq('pemrograman', pemrograman)
        .order('part', ascending: true)
        .execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    return dataList;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
