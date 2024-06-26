import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/about/views/about_view.dart';
import 'package:himtika_apps/app/modules/kontak/views/kontak_view.dart';
import 'package:himtika_apps/app/modules/library/views/library_view.dart';
import 'package:himtika_apps/app/modules/more/views/menu_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../login/views/privacy_view.dart';
import '../../login/views/tc_view.dart';
import '../controllers/more_controller.dart';

class MoreView extends GetView<MoreController> {
  _launchInstagram() async {
    const nativeUrl = "instagram://user?username=himtika_unsika";
    const webUrl = "https://www.instagram.com/himtika_unsika/";
    if (await canLaunch(nativeUrl)) {
      await launch(nativeUrl);
    } else if (await canLaunch(webUrl)) {
      await launch(webUrl);
    } else {
      print("can't open Instagram");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 25,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 39, 137, 216),
        title: Text(
          'More',
          style: GoogleFonts.breeSerif(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 228, 228, 233),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Color.fromARGB(255, 228, 228, 233),
                  height: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MenuView(
                              to: LibraryView(),
                              title: "Library & \nArticle",
                              icon: "assets/img/articleIcon.png"),
                          MenuView(
                              to: AboutView(),
                              title: "About \nHimfo",
                              icon: "assets/img/aboutIcon.png")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MenuView(
                              to: KontakView(),
                              title: "Kontak \nKami",
                              icon: "assets/img/kontakIcon.png"),
                          InkWell(
                            onTap: () => _launchInstagram(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 22, 98, 168),
                                      offset: Offset(2.0, 2.0),
                                      spreadRadius: 1.0),
                                  BoxShadow(
                                      color: Color.fromARGB(255, 245, 245, 245),
                                      offset: Offset(-1.0, -1.0),
                                      spreadRadius: 1.0)
                                ],
                              ),
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(10),
                              width: Get.width * 0.4,
                              child: Column(
                                children: [
                                  Image.asset("assets/img/sosmedIcon.png"),
                                  Text(
                                    "Social \nMedia",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.breeSerif(
                                      textStyle: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // MenuView(
                          //     to: HimtikaView(),
                          //     title: "Social \nMedia",
                          //     icon: "assets/img/sosmedIcon.png"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Color.fromARGB(255, 228, 228, 233),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => terms_conditionView());
                          },
                      ),
                      TextSpan(
                          text: ' and',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          )),
                      TextSpan(
                        text: ' Privacy Policy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => PrivacyView());
                          },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
