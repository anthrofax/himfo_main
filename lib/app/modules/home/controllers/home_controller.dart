import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:himtika_apps/app/modules/login/views/login_view.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  var curentSlider = 0.obs;

  current(value) {
    curentSlider.value = value;
  }

  Future<List> getEvent() async {
    // String email = "2110631170085@student.unsika.ac.id";
    var response = await Supabase.instance.client
        .from('event')
        .select()
        .limit(3)
        .order("created_at", ascending: false)
        .execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    return dataList;
  }

  void getAssets() async {
    // String email = "2110631170085@student.unsika.ac.id";
    final box = GetStorage();
    String email = box.read("email");

    var response3 = await Supabase.instance.client
        .from('admin')
        .select()
        .eq('email', email)
        .execute();
    final dataList3 = jsonDecode(jsonEncode(response3.data));
    List? data3 = dataList3;

    var response =
        await Supabase.instance.client.from('grand_design').select().execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    List? data = dataList;

    var response2 = await Supabase.instance.client
        .from('himtika_banner')
        .select()
        .execute();
    final dataList2 = jsonDecode(jsonEncode(response2.data));
    List? data2 = dataList2;

    final response5 = await Supabase.instance.client
        .from('admin_notification')
        .select()
        .execute();

    final dataList5 = jsonDecode(jsonEncode(response5.data));
    final data5 =
        dataList5.map<String>((m) => m['id_notification'] as String).toList();

    final response6 = await Supabase.instance.client
        .from('user_notification')
        .select()
        .not('email', 'eq', email)
        .execute();

    final dataList6 = jsonDecode(jsonEncode(response6.data));
    final data6 =
        dataList6.map<String>((m) => m['ids_notification'] as String).toList();

    OneSignal.shared.getDeviceState().then((deviceState) {
      box.write("playerIdOneSignal", deviceState?.userId);
    });

    update();
    box.write("id_notification_admin", data5);
    box.write("users_notification", data6);
    print(data6);
    box.write("admin", data3!.isEmpty ? "false" : "true");

    String admin = box.read("admin");
    String user_id_notification = box.read("playerIdOneSignal");

    //update id_notification if admin
    if (admin != "false") {
      Supabase.instance.client
          .from('admin')
          .update({'id_notification': user_id_notification})
          .eq("email", email)
          .execute();
    }

    Supabase.instance.client
        .from('user_notification')
        .upsert({'email': email, 'ids_notification': user_id_notification})
      ..execute();

    box.write("grand_design", data![0]['book'].toString());
    box.write("cp_himtika", data2![0]['img'].toString());
  }

  Future<List> getHicode() async {
    var response = await Supabase.instance.client
        .from('hicode')
        .select()
        .eq('id', 1)
        .execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    return dataList;
  }

  Future<PostgrestResponse<dynamic>> getDivisi() async {
    PostgrestResponse snapshot = await Supabase.instance.client
        .from('divisi')
        .select()
        .order('id', ascending: true)
        .execute();
    return snapshot;
  }

  Future<List> getDivisiByCode(String codeDivisi) async {
    var response = await Supabase.instance.client
        .from('divisi')
        .select()
        .eq('code_divisi', codeDivisi)
        .execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    return dataList;
  }

  Future<List> getAnggotaDivisi(String divisi) async {
    var response = await Supabase.instance.client
        .from(divisi)
        .select()
        .order('id', ascending: true)
        .execute();
    final dataList = jsonDecode(jsonEncode(response.data));
    return dataList;
  }

  LogOut(context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        Supabase.instance.client.auth.signOut();
        final box = GetStorage();
        box.remove('nama');
        Get.offAll(LoginView());
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout"),
      content: Text("Are you sure, do you want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
  }
}



// FutureBuilder<PostgrestResponse<dynamic>>(
//   future: controller.getDivisi(),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState ==
//         ConnectionState.done) {
//       List datas = jsonDecode(
//           jsonEncode(snapshot.data!.data));
//       return ListView.builder(
//         itemCount: datas.length,
//         itemBuilder: (context, index) => ListTile(
//           title: Text(datas[index]['img']),
//         ),
//       );
//     }
//     return Center();
//   },
// ),
