import 'package:get/get.dart';

import 'package:himtika_apps/app/modules/about/bindings/about_binding.dart';
import 'package:himtika_apps/app/modules/about/views/about_view.dart';
import 'package:himtika_apps/app/modules/anonymous_chat/bindings/anonymous_chat_binding.dart';
import 'package:himtika_apps/app/modules/anonymous_chat/views/anonymous_chat_view.dart';
import 'package:himtika_apps/app/modules/event/bindings/event_binding.dart';
import 'package:himtika_apps/app/modules/event/views/event_view.dart';
import 'package:himtika_apps/app/modules/hicode/bindings/hicode_binding.dart';
import 'package:himtika_apps/app/modules/hicode/views/hicode_view.dart';
import 'package:himtika_apps/app/modules/himtika/bindings/himtika_binding.dart';
import 'package:himtika_apps/app/modules/himtika/views/himtika_view.dart';
import 'package:himtika_apps/app/modules/home/bindings/home_binding.dart';
import 'package:himtika_apps/app/modules/home/views/home_view.dart';
import 'package:himtika_apps/app/modules/information/bindings/information_binding.dart';
import 'package:himtika_apps/app/modules/information/views/information_view.dart';
import 'package:himtika_apps/app/modules/kontak/bindings/kontak_binding.dart';
import 'package:himtika_apps/app/modules/kontak/views/kontak_view.dart';
import 'package:himtika_apps/app/modules/library/bindings/library_binding.dart';
import 'package:himtika_apps/app/modules/library/views/library_view.dart';
import 'package:himtika_apps/app/modules/login/bindings/login_binding.dart';
import 'package:himtika_apps/app/modules/login/views/login_view.dart';
import 'package:himtika_apps/app/modules/more/bindings/more_binding.dart';
import 'package:himtika_apps/app/modules/more/views/more_view.dart';
import 'package:himtika_apps/app/modules/proker/bindings/proker_binding.dart';
import 'package:himtika_apps/app/modules/proker/views/proker_view.dart';
import 'package:himtika_apps/app/modules/task/bindings/task_binding.dart';
import 'package:himtika_apps/app/modules/task/views/task_view.dart';
import 'package:himtika_apps/app/modules/vicode/bindings/vicode_binding.dart';
import 'package:himtika_apps/app/modules/vicode/views/vicode_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.EVENT,
      page: () => EventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION,
      page: () => InformationView(),
      binding: InformationBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.HIMTIKA,
      page: () => HimtikaView(),
      binding: HimtikaBinding(),
    ),
    GetPage(
      name: _Paths.LIBRARY,
      page: () => LibraryView(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: _Paths.PROKER,
      page: () => ProkerView(),
      binding: ProkerBinding(),
    ),
    GetPage(
      name: _Paths.MORE,
      page: () => MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: _Paths.ANONYMOUS_CHAT,
      page: () => AnonymousChatView(),
      binding: AnonymousChatBinding(),
    ),
    GetPage(
      name: _Paths.VICODE,
      page: () => VicodeView(),
      binding: VicodeBinding(),
    ),
    GetPage(
      name: _Paths.HICODE,
      page: () => HicodeView(),
      binding: HicodeBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.KONTAK,
      page: () => KontakView(),
      binding: KontakBinding(),
    ),
  ];
}
