import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/himtika/views/menu_himtika_view.dart';
import 'package:himtika_apps/app/modules/himtika/views/pendidik_view.dart';
import 'package:himtika_apps/app/modules/himtika/views/pengurus_himtika_view.dart';
import 'package:himtika_apps/app/modules/himtika/views/sejarah_view.dart';
import 'package:himtika_apps/app/modules/himtika/views/visi_misi_view.dart';
import 'package:himtika_apps/app/modules/proker/views/proker_view.dart';

import '../../plugin/pdfViewDetail.dart';
import '../controllers/himtika_controller.dart';

class HimtikaView extends GetView<HimtikaController> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String grand_design = box.read("grand_design");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
        backgroundColor: Color(0xFF1C1C1E),
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
        title: Text(
          'HIMTIKA',
          style: GoogleFonts.breeSerif(
            fontSize: 22.0,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 228, 228, 233),
          child: ListView(
            children: [
              SizedBox(
                height: 120,
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
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
                              bottomLeft: Radius.circular(55),
                              bottomRight: Radius.circular(55))),
                    ),
                    Positioned(
                      top: 10,
                      left: 30,
                      child: Row(
                        children: <Widget>[
                          Hero(
                            tag: 'visiPhoto',
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Image.asset('assets/img/scIcon.png'),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 10.0)),
                          Text('Himpunan Mahasiswa\nTeknik Informatika\nUNSIKA',
                              style: GoogleFonts.breeSerif(
                                  fontSize: 18.0, color: Colors.white))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MenuHimtikaView(
                to: VisiMisiView(),
                title: "Visi dan Misi\nHIMTIKA",
                icon: 'assets/img/visiIcon.png',
                color: Colors.indigo,
              ),
              SizedBox(
                height: 10,
              ),
              MenuHimtikaView(
                to: SejarahView(),
                title: "Sejarah\nHIMTIKA",
                icon: 'assets/img/sejarahIcon.png',
                color: Colors.green,
              ),
              SizedBox(
                height: 10,
              ),
              MenuHimtikaView(
                to: PengurusHimtikaView(),
                title: "Pengurus\nHIMTIKA",
                icon: 'assets/img/pengurusIcon.png',
                color: Colors.orange,
              ),
              SizedBox(
                height: 10,
              ),
              MenuHimtikaView(
                to: ProkerView(),
                title: "Program Kerja\nHIMTIKA",
                icon: 'assets/img/prokerIcon.png',
                color: Colors.red,
              ),
              SizedBox(
                height: 10,
              ),
              MenuHimtikaView(
                to: PdfViewDetail(
                  book: "${grand_design}",
                  title: "GRAND DESIGN",
                ),
                title: "Grand Desain\nHIMTIKA",
                icon: 'assets/img/grandDesainIcon.png',
                color: Colors.blue,
              ),
              SizedBox(
                height: 10,
              ),
              MenuHimtikaView(
                to: PendidikView(),
                title: "Tenaga\nPendidik",
                icon: 'assets/img/pendidikIcon.png',
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
