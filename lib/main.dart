import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:himtika_apps/app/modules/home/controllers/home_controller.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:upgrader/upgrader.dart';

import 'app/auth/config/enviroment.dart';
import 'app/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/widgets/splash.dart';

final providerContainer = ProviderContainer();

void main() async {
  await GetStorage.init();

  //Remove this method to stop OneSignal Debugging
  // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  final String oneSignalAppId = "8ac32457-3d52-4c1a-8f91-2f0189a788de";
  await OneSignal.shared.setAppId(oneSignalAppId);

  await dotenv.load(fileName: Environment.fileName);
  Supabase.initialize(
    anonKey: Environment.supabaseAnonKey,
    url: Environment.supabaseUrl,
    debug: false,
  );

  runApp(
    UncontrolledProviderScope(
      container: providerContainer,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // status bar color
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);

    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapssot) {
        if (snapssot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          // Supabase.instance.client.auth.signOut();
          String sesi =
              (Supabase.instance.client.auth.session()?.user?.id).toString();
          if (sesi != "null") {
            final box = GetStorage();
            box.write(
                "email", Supabase.instance.client.auth.session()!.user!.email);
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Himfo",
              initialRoute: Routes.HOME,
              getPages: AppPages.routes,
            );
          } else {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Himfo",
              initialRoute: Routes.LOGIN,
              getPages: AppPages.routes,
            );
          }
        }
      },
    );
  }
}
