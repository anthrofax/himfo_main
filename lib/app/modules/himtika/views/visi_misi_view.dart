import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class VisiMisiView extends GetView {
  @override
  Widget build(BuildContext context) {
    Widget _buildImage(String assetName, [double width = 100]) {
      return Image.asset('assets/img/$assetName', width: width);
    }

    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color.fromARGB(255, 228, 228, 233),
      imagePadding: EdgeInsets.zero,
      imageFlex: 0,
    );
    return SafeArea(
      child: IntroductionScreen(
        showNextButton: true,
        overrideNext: InkWell(
          onTap: () => Navigator.pop(context),
          child: Text(
            "Close",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(220, 235, 235, 245),
            ),
          ),
        ),
        showSkipButton: false,
        showDoneButton: true,
        overrideDone: InkWell(
          onTap: () => Navigator.pop(context),
          child: Text(
            "Close",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(220, 235, 235, 245),
            ),
          ),
        ),
        globalBackgroundColor: Color(0xFF1C1C1E),
        pages: [
          PageViewModel(
            titleWidget: Text(
              "",
              style: TextStyle(fontSize: 0),
            ),
            bodyWidget: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: AutoSizeText(
                    "Menjadi himpunan yang mampu mengembangkan softskill dan hardskill serta menjadi wadah aspirasi dan kreativitas yang mandiri, aspiratif, berkualitas, dan berprestasi dengan berwawasan Ilmu pengetahuan dan teknologi untuk menjunjung tinggi martabat himpunan, masyarakat, bangsa dan negara.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            image: Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    _buildImage('logo_himtika.png', 150),
                    SizedBox(height: 10),
                    Text(
                      "Visi",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                )),
            decoration: pageDecoration,
          ),
          PageViewModel(
            titleWidget: Text(
              "",
              style: TextStyle(fontSize: 0),
            ),
            bodyWidget: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: AutoSizeText(
                    "1. Menjalin solidaritas dan rasa kekeluargaan himpunan serta civitas akademik FASILKOM UNSIKA\n\n2. Menyalurkan bakat, kreativitas, mendayagunakan dan mengembangkan potensi sesuai dengan minat dalam diri mahasiswa/mahasiswi himpunan Teknik Informatika.\n\n3. Menyusun dan melaksanakan program yang bermanfaat untuk mahasiswa/mahasiswi Teknik Informatika di masyarakat.\n\n4. Mendukung silabus akademik dengan memperkuat basis pengetahuan yang mandiri.\n\n5. Memperkuat kerja sama dengan pihak eksternal FASILKOM UNSIKA.\n\n6. Berkontribusi dalam pengabdian yang berkaitan dengan keilmuan Teknik Informatika bagi masyarakat global.\n\n7. Memfasilitasi upaya peningkatan prestasi mahasiswa jurusan Teknik Informatika baik di tingkat nasional maupun internasional.\n\n8. Menyelenggarakan kegiatan yang mendukung tercapainya mahasiswa Teknik Informatika yang aktif, memiliki solidaritas yang tinggi, berintegritas serta wawasan dan keterampilan dalam bidang teknologi informasi yang berkompeten.",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                        fontSize: 17,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            image: Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    _buildImage('logo_himtika.png', 150),
                    SizedBox(height: 10),
                    Text(
                      "Misi",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  ],
                )),
            decoration: pageDecoration,
          ),
        ],
      ),
    );
  }
}
