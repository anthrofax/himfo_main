import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/home/controllers/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

// ignore: must_be_immutable
class GetSliderHomeView extends GetView {
  HomeController controller = HomeController();
  GetSliderHomeView({
    required this.datas,
    Key? key,
  }) : super(key: key);

  late final List datas;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: datas.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  InkWell(
            onTap: () {
              if (datas[itemIndex]['id'] <= 6 && datas[itemIndex]['id'] >= 2) {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.INFO,
                  btnOkColor: Color(0xFF398AE5),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        datas[itemIndex]['ket'],
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  title: 'This is Ignored',
                  desc: 'This is also Ignored',
                  btnOkOnPress: () {},
                )..show();
              } else if (datas[itemIndex]['id'] == 1) {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.INFO,
                  btnOkColor: Color(0xFF398AE5),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        datas[itemIndex]['ket'],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  title: 'This is Ignored',
                  desc: 'This is also Ignored',
                  btnOkOnPress: () {},
                )..show();
              } else {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.INFO,
                  btnOkColor: Color(0xFF398AE5),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        datas[itemIndex]['ket'],
                        style: GoogleFonts.sourceSansPro(
                          textStyle: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  title: 'This is Ignored',
                  desc: 'This is also Ignored',
                  btnOkOnPress: () {},
                )..show();
              }
            },
            child: Container(
              // padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(left: 5, right: 5),

              child: CachedNetworkImage(
                imageUrl: datas[itemIndex]['img'],
                imageBuilder: (context, imageProvider) => Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Color(0xFFFFFFF).withOpacity(0.92),
                          BlendMode.dstATop),
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              // Image.network(
              //   datas[itemIndex]['img'],
              //   fit: BoxFit.fill,
              //   height: double.infinity,
              //   width: double.infinity,
              // ),
            ),
          ),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              controller.current(index);
            },
            autoPlayInterval: Duration(seconds: 4),
            autoPlay: true,
            aspectRatio: 14 / 5,
            viewportFraction: 0.8,
          ),
        ),
        Obx(() => buildIndicator()),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: controller.curentSlider.value,
        count: datas.length,
        effect: JumpingDotEffect(
          activeDotColor: Color.fromARGB(255, 16, 127, 146),
          dotColor: Colors.white,
          dotHeight: 8,
          dotWidth: 8,
          jumpScale: .7,
          verticalOffset: 15,
        ),
      );
}
