import 'dart:convert';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/anonymous_chat/views/anonymous_chat_view.dart';
import 'package:himtika_apps/app/modules/home/views/divisi_view.dart';
import 'package:himtika_apps/app/modules/home/views/get_slider_home_view.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:upgrader/upgrader.dart';
import '../controllers/home_controller.dart';
import 'event_home_view.dart';
import 'item_menu_view.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  /// Construct a color from a hex code string, of the format #RRGGBB.
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Widget build(BuildContext context) {
    controller.getAssets();
    final box = GetStorage();
    String? email = box.read("nama");

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Transform.rotate(
              angle: 180 * pi / 180,
              child: GestureDetector(
                onTap: () => controller.LogOut(context),
                child: Icon(
                  Icons.logout,
                ),
              ),
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 39, 137, 216),
                Color(0XFF1CB5E0),
              ],
            ),
          ),
        ),
        elevation: 0,
        title: AutoSizeText(
          "Hallo, ${email != null ? email.capitalize : "Selamat datang di HIMFO"}",
          style: GoogleFonts.sourceSansPro(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          maxLines: 1,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            // color: Color.fromARGB(185, 5, 88, 156),
            color: Color.fromARGB(255, 242, 242, 246),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // UpgradeAlert(
              //   upgrader: Upgrader(
              //       dialogStyle: UpgradeDialogStyle.cupertino,
              //       showIgnore: false,
              //       showLater: false,
              //       durationUntilAlertAgain: Duration(minutes: 5)),
              // ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollBehavior(),
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 40),
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 5, bottom: 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromARGB(255, 39, 137, 216),
                              Color(0XFF1CB5E0),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.elliptical(25, 12),
                            bottomRight: Radius.elliptical(25, 12),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FutureBuilder<PostgrestResponse<dynamic>>(
                                  future: controller.getDivisi(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      List datas = jsonDecode(
                                          jsonEncode(snapshot.data?.data));
                                      return GetSliderHomeView(datas: datas);
                                    }
                                    return Container(
                                      padding: EdgeInsets.only(bottom: 25),
                                      child: CarouselSlider.builder(
                                        itemCount: 3,
                                        itemBuilder: (BuildContext context,
                                            int itemIndex, int pageViewIndex) {
                                          return Shimmer.fromColors(
                                            baseColor: Color.fromARGB(
                                                255, 185, 185, 185),
                                            highlightColor: Color.fromARGB(
                                                255, 255, 255, 255),
                                            child: Container(
                                              margin: EdgeInsets.only(left: 20),
                                              width: Get.width * 1,
                                              height: Get.width * 1,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Color.fromARGB(
                                                    255, 185, 185, 185),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [],
                                              ),
                                            ),
                                          );
                                        },
                                        options: CarouselOptions(
                                          autoPlayInterval:
                                              Duration(seconds: 4),
                                          autoPlay: true,
                                          aspectRatio: 16 / 7,
                                          viewportFraction: 0.8,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ItemMenuView(
                              to: '/event',
                              title: "Event",
                              icon: "assets/img/event.png",
                            ),
                            ItemMenuView(
                              to: '/information',
                              title: "Info",
                              icon: "assets/img/info.png",
                            ),
                            ItemMenuView(
                              to: '/vicode',
                              title: "Vicode",
                              icon: "assets/icon/video.png",
                            ),
                            ItemMenuView(
                              to: '/library',
                              title: "Library",
                              icon: "assets/img/library.png",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ItemMenuView(
                              to: '/himtika',
                              title: "Himtika",
                              icon: "assets/img/logo_himtika.png",
                            ),
                            ItemMenuView(
                              to: '/hicode',
                              title: "Hicode",
                              icon: "assets/img/studyclub.png",
                            ),
                            ItemMenuView(
                              to: '/task',
                              title: "Task",
                              icon: "assets/icon/todo.png",
                            ),
                            ItemMenuView(
                              to: '/more',
                              title: "More",
                              icon: "assets/img/menu.png",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Divisi",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        padding: EdgeInsets.only(left: 5),
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Row(
                          children: [
                            DivisiView(
                              title: 'Divisi\nInternal',
                              title2: 'Divisi Internal',
                              icon: 'assets/img/divInternal.png',
                              codeDivisi: "internal",
                            ),
                            DivisiView(
                              title: 'Divisi\nEdukasi',
                              title2: 'Divisi Edukasi',
                              icon: 'assets/img/divEdukasi.png',
                              codeDivisi: "edukasi",
                            ),
                            DivisiView(
                              title: 'Divisi\nRnD',
                              title2: 'Divisi Research and Development',
                              icon: 'assets/img/divRND2.png',
                              codeDivisi: "rnd",
                            ),
                            DivisiView(
                              title: 'Divisi\nRelasi',
                              title2: 'Divisi Relasi',
                              icon: 'assets/img/divRelasi.png',
                              codeDivisi: "relasi",
                            ),
                            DivisiView(
                              title: 'Divisi\nInfokom',
                              title2: 'Divisi Informasi dan Komunikasi',
                              icon: 'assets/img/siakadIcon.png',
                              codeDivisi: "infokom",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Event",
                              style: GoogleFonts.sourceSansPro(
                                textStyle: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: InkWell(
                              onTap: () => Get.toNamed("/event"),
                              child: Text(
                                "Lihat Semua",
                                style: GoogleFonts.sourceSansPro(
                                  textStyle: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: EventHomeView(
                          contextEvent: context,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 75,
        child: FloatingActionButton(
          hoverElevation: 0,
          highlightElevation: 0,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          backgroundColor: Color.fromARGB(0, 149, 198, 14),
          elevation: 0,
          onPressed: () => Get.to(
            () => AnonymousChatView(),
          ),
          child: Image.asset(
            "assets/icon/consul.gif",
            height: 200,
            // color: Colors.white.withOpacity(0.9),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
      ),
    );
  }
}
