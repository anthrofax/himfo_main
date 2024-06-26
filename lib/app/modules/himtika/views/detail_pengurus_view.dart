import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/home/controllers/home_controller.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../event/views/detail_image_view.dart';

class DetailPengurusView extends GetView {
  DetailPengurusView({
    required this.title,
    required this.codeDivisi,
    Key? key,
  }) : super(key: key);

  final String title;
  final String codeDivisi;

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();
    _launchInstagram(String username) async {
      String nativeUrl = "instagram://user?username=${username}";
      String webUrl = "https://www.instagram.com/${username}/";

      if (username != "null" && username != "") {
        if (await canLaunch(nativeUrl)) {
          await launch(nativeUrl);
        } else if (await canLaunch(webUrl)) {
          await launch(webUrl);
        } else {
          print("can't open Instagram");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Profile Instagram tidak ditemukan",
            textAlign: TextAlign.center,
          ),
        ));
      }
    }

    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecorationSecond = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      imagePadding: EdgeInsets.zero,
      contentMargin: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      bodyAlignment: Alignment.bottomCenter,
      imageAlignment: Alignment.topCenter,
      imageFlex: 1,
      bodyFlex: 0,
      fullScreen: true,
    );
    return IntroductionScreen(
      dotsDecorator:
          DotsDecorator(color: Colors.white, activeColor: Colors.amber),
      showNextButton: true,
      overrideNext: InkWell(
        onTap: () => Navigator.pop(context),
        child: Text(
          "Close",
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      showSkipButton: false,
      showDoneButton: true,
      overrideDone: InkWell(
        onTap: () => Navigator.pop(context),
        child: Text(
          "Close",
          style: GoogleFonts.notoSans(
            textStyle: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          titleWidget: Text(
            "",
            style: TextStyle(fontSize: 0),
          ),
          bodyWidget: Text(
            "",
            style: TextStyle(fontSize: 0),
          ),
          image: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF606c88),
                  Color(0xFF3f4c6b),
                ],
              ),
            ),
            height: Get.height * 1,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "${title}",
                  style: GoogleFonts.notoSans(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: FutureBuilder<List>(
                      future:
                          controller.getAnggotaDivisi("anggota_${codeDivisi}"),
                      builder: (context, snapshot) {
                        List? data = snapshot.data;
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              height: Get.height * 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor, // Red
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                        return ListView.builder(
                          padding: EdgeInsets.only(bottom: 50),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 4.0),
                              padding: EdgeInsets.all(8.0),
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                  color: Color.fromARGB(123, 255, 255, 255)),
                              child: ListTile(
                                leading: InkWell(
                                  onTap: () => Get.to(
                                    () => DetailImageView(
                                      img: data[index]['img'],
                                      tagHero:
                                          '${data[index]["id"]}${data[index]['nama']}',
                                    ),
                                  ),
                                  child: Hero(
                                    tag:
                                        '${data[index]["id"]}${data[index]['nama']}',
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              data[index]['img'],
                                              cacheKey: data[index]['img']),
                                          fit: BoxFit.fitWidth,
                                          alignment:
                                              FractionalOffset(0.5, 0.16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  data[index]['nama'],
                                  style: GoogleFonts.notoSans(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                subtitle: Text(
                                  data[index]['jabatan'],
                                  style: GoogleFonts.notoSans(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                trailing: GestureDetector(
                                  onTap: () => _launchInstagram(
                                      data[index]['ig'].toString()),
                                  child: Image.asset(
                                    'assets/icon/instagram.png',
                                    width: 32,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
          decoration: pageDecorationSecond,
        ),
      ],
    );
  }
}
