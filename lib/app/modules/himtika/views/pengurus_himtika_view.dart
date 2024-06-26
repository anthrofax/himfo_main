import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/himtika/views/detail_pengurus_view.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:photo_view/photo_view.dart';

class PengurusHimtikaView extends GetView {
  @override
  Widget build(BuildContext context) {
    List<StaggeredTile> _cardTile = <StaggeredTile>[
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 1.5),
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 1.5),
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 1.5),
      StaggeredTile.count(2, 2),
      StaggeredTile.count(2, 1.5),
    ];
    List<Widget> _listTile = <Widget>[
      BackGroundTile(
        backgroundColor: Colors.red,
        icondata: Icons.home,
        title: "Ketua & Wakil",
        codeDivisi: "ketuaWakil",
      ),
      BackGroundTile(
        backgroundColor: Colors.orange,
        icondata: Icons.ac_unit,
        title: "Sekretaris",
        codeDivisi: "sekretaris",
      ),
      BackGroundTile(
        backgroundColor: Colors.pink,
        icondata: Icons.landscape,
        title: "Bendahara",
        codeDivisi: "bendahara",
      ),
      BackGroundTile(
        backgroundColor: Colors.green,
        icondata: Icons.portrait,
        title: "Edukasi",
        codeDivisi: "edukasi",
      ),
      BackGroundTile(
        backgroundColor: Colors.cyan,
        icondata: Icons.search_sharp,
        title: "Informasi dan Komunikasi",
        codeDivisi: "infokom",
      ),
      BackGroundTile(
        backgroundColor: Colors.blue,
        icondata: Icons.access_alarms,
        title: "Relasi",
        codeDivisi: "relasi",
      ),
      BackGroundTile(
        backgroundColor: Colors.indigo,
        icondata: Icons.satellite_outlined,
        title: "Research and Development",
        codeDivisi: "rnd",
      ),
      BackGroundTile(
        backgroundColor: Colors.deepPurpleAccent,
        icondata: Icons.music_note,
        title: "Internal",
        codeDivisi: "internal",
      ),
    ];

    final box = GetStorage();
    String cp_himtika = box.read("cp_himtika");

    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      imagePadding: EdgeInsets.zero,
      contentMargin: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      bodyAlignment: Alignment.bottomCenter,
      imageAlignment: Alignment.topCenter,
      imageFlex: 3,
      bodyFlex: 0,
      fullScreen: true,
    );

    return Scaffold(
      body: Container(
        height: Get.height * 1,
        color: Color.fromARGB(255, 242, 242, 246),
        child: IntroductionScreen(
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Pengurus Himtika",
                      style: GoogleFonts.notoSans(
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: 100,
                            maxHeight: Get.width * (9 / 17),
                          ),
                          child: PhotoView(
                            backgroundDecoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            minScale: PhotoViewComputedScale.contained * 1.03,
                            maxScale: PhotoViewComputedScale.covered * 4,
                            imageProvider: CachedNetworkImageProvider(
                              cp_himtika,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: StaggeredGridView.count(
                          physics: BouncingScrollPhysics(),
                          crossAxisCount: 4,
                          staggeredTiles: _cardTile,
                          children: _listTile,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: pageDecoration,
            ),
          ],
        ),
      ),
    );
  }
}

class BackGroundTile extends StatelessWidget {
  final Color backgroundColor;
  final IconData icondata;
  final String title;
  final String codeDivisi;

  BackGroundTile(
      {required this.backgroundColor,
      required this.icondata,
      required this.codeDivisi,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailPengurusView(title: title, codeDivisi: codeDivisi));
      },
      child: Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icon/avatar.gif",
              width: Get.width * 0.2,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.ptSerif(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
