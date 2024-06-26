import 'dart:convert';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LibraryController extends GetxController {
  Future<List> getLibrary() async {
    // String email = "2110631170085@student.unsika.ac.id";
    var response =
        await Supabase.instance.client.from('perpustakaan').select().execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    update();
    return dataList;
  }

  Future<List> getLibraryRecomended() async {
    // String email = "2110631170085@student.unsika.ac.id";
    var response = await Supabase.instance.client
        .from('perpustakaan')
        .select()
        .eq("recomended", 1)
        .execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    update();
    return dataList;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
