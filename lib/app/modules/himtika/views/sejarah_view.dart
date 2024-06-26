import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

List databody = [
  "Pada tahun 2012 terbentuknya sebuah marwah himpunan namun ada beberapa faktor yang belum bisa merealisasikan terbentuknya sebuah himpunan, maka dengan hal tersebut mahasiswa teknik informatika mempunyai hasrat yang tinggi untuk mewujudkan terbentuknya himpunan di tingkat prodi yang berfokus di bidang keilmuan dan profesi. Namun bukan himpunan melainkan study club (SC) yang dimana SC adalah sebagai cikal bakal berdirinya himpunan yang di persiapkan oleh mahasiswa angkatan 2012 dan 2013.",
  "Pada kepengurusan BEMF 2014 meneruskan perjuangan angkatan 2012 dan 2013 yang mengkaji dan menginisiasi agar terbentuknya sebuah himpunan,maka diadakannya sebuah Musyawarah Anggota yang pertama (MUSANG) yang pertama pada tanggal 14 oktober 2017. Didalam musyawarah anggota tersebut membahas tentang AD ART serta GBHPK himpunan dan himpunan ini pun berhasil mendapatkan nama dengan nama HIMTIKA. Dinamakan HIMTIKA karena pada dasarnya HIMTIKA ini ingin mempunyai ciri khas dan ingin berbeda dengan nama himpunan Teknik Informatika di kampus-kampus lain, dan HIMTIKA yang kepanjangannya adalah Himpunan Mahasiswa Teknik Informatika Unsika. Nama HIMTIKA tersebut merupakan usul dari angkatan 2014 yang bernama kasun sonjaya. Maka disepakatilah nama HIMTIKA tersebut. Lalu musyawarah anggota pun berhasil mendapatkan ketua dan wakil ketua himpunan yang bernama ahmad khusaeri sebagai ketua himpunan dan adi rohmat sebagai wakil ketua himpunan.",
  "Himtika pun resmi lahir pada tanggal 16 Oktober 2017 pukul 06.00 di aula Unsika"
];
List datatitle = [
  "Pada Tahun 2012",
  "Pada Kepengurusan BEMF 2014",
  "Pada Tanggal 16 Oktober 2017"
];

class SejarahView extends GetView {
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
        backgroundColor: Color(0xFF398AE5),
        title: Text(
          'Sejarah Himtika',
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
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return new Stack(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            datatitle[index],
                            textAlign: TextAlign.left,
                            style: GoogleFonts.notoSans(
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          new Container(
                            padding: EdgeInsets.all(5),
                            width: double.infinity,
                            child: Text(
                              databody[index],
                              style: GoogleFonts.notoSans(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  new Positioned(
                    top: 0.0,
                    bottom: 0.0,
                    left: 35.0,
                    child: new Container(
                      height: double.infinity,
                      width: 1.0,
                      color: Colors.blue,
                    ),
                  ),
                  new Positioned(
                    top: 15.0,
                    left: 15.0,
                    child: new Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.indigo,
                      ),
                      child: new Container(
                        margin: new EdgeInsets.all(5.0),
                        height: 30.0,
                        width: 30.0,
                        decoration: new BoxDecoration(shape: BoxShape.circle),
                        child: Icon(
                          Icons.more_time,
                          color: Color.fromARGB(215, 235, 235, 245),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: 3,
          ),
        ),
      ),
    );
  }
}
