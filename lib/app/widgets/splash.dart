import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.cyanAccent[400]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SizedBox.expand(
          child: Stack(
            children: <Widget>[
              Positioned(
                right: -60,
                top: -30,
                child: Image.asset('assets/img/variasi.png'),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 220,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/img/logo_himtika.png'))),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text('HIMTIKA',
                        style: GoogleFonts.poppins(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))
                  ]),
              Positioned(
                bottom: -40,
                left: -65,
                child: Image.asset('assets/img/variasi2.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
