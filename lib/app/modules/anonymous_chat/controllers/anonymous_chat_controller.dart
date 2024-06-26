import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../views/BadWord.dart';

class AnonymousChatController extends GetxController {
  void sendForUser(String playerId, String title, String content) async {
    if (playerId == "null") {
    } else {
      await OneSignal.shared.postNotification(OSCreateNotification(
        androidSmallIcon: "@mipmap/ic_launcher",
        playerIds: [playerId],
        content: BadWord().KataKotor(content),
        heading: title,
        sendAfter: DateTime.now().add(Duration(seconds: 1)).toUtc(),
      ));
    }
  }

  void sendForAdmin(String title, String content) async {
    final box = GetStorage();
    List<String> user_notification = box.read("id_notification_admin");

    await OneSignal.shared.postNotification(OSCreateNotification(
      androidSmallIcon: "@mipmap/ic_launcher",
      playerIds: user_notification,
      content: BadWord().KataKotor(content),
      heading: title,
      sendAfter: DateTime.now().add(Duration(seconds: 1)).toUtc(),
    ));
  }

  void sendForAll(String title, String content) async {
    final box = GetStorage();
    List<String> users_notification = box.read("users_notification");

    await OneSignal.shared.postNotification(OSCreateNotification(
      androidSmallIcon: "@mipmap/ic_launcher",
      playerIds: users_notification,
      content: BadWord().KataKotor(content),
      heading: title,
      sendAfter: DateTime.now().add(Duration(seconds: 1)).toUtc(),
    ));
  }

  @override
  void onInit() {
    super.onInit();
  }
}
