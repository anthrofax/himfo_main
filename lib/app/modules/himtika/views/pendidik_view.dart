import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/himtika/controllers/himtika_controller.dart';

// ignore: must_be_immutable
class PendidikView extends GetView {
  HimtikaController controller = HimtikaController();
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
        title: Text('Tenaga Pendidik',
            style: GoogleFonts.breeSerif(
              fontSize: 22.0,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 228, 228, 233),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List>(
                future: controller.getPendidik(),
                builder: (context, snapshot) {
                  List? data = snapshot.data;

                  if (snapshot.data == null) {
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
                  } else {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      // ignore: unnecessary_null_comparison
                      itemCount:
                          data!.length == null ? 0 : snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                          padding: EdgeInsets.all(8.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(13.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(2.0, 2.0),
                                    spreadRadius: 1.0),
                                BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 2,
                                    offset: Offset(-1.0, -1.0),
                                    spreadRadius: 1.0)
                              ]),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 60,
                                  child: Image.asset(
                                      'assets/img/logo-unsika2.png'),
                                ),
                                title: Text(
                                  data[index]['nama'],
                                  style: GoogleFonts.breeSerif(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(
                                  'Dosen',
                                  style: GoogleFonts.breeSerif(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Teknik Informatika\nFASILKOM',
                                    style: GoogleFonts.breeSerif(
                                        color: Colors.black87),
                                  ),
                                  SizedBox(),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.red[900],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        data[index]['kampus']
                                            .toString()
                                            .toUpperCase(),
                                        style: GoogleFonts.breeSerif(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Container(
//                       margin:
//                           EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
//                       padding: EdgeInsets.all(8.0),
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(13.0),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.grey,
//                                 blurRadius: 10.0,
//                                 offset: Offset(4.0, 4.0),
//                                 spreadRadius: 1.0),
//                             BoxShadow(
//                                 color: Colors.white,
//                                 blurRadius: 10.0,
//                                 offset: Offset(-4.0, -4.0),
//                                 spreadRadius: 1.0)
//                           ]),
//                       child: Column(
//                         children: [
//                           ListTile(
//                             leading: Container(
//                               height: 60,
//                               child: Image.asset('assets/img/logo-unsika.png'),
//                             ),
//                             title: Text(data['nama'],
//                                 style: GoogleFonts.poppins(
//                                     fontSize: 18.0, color: Colors.black)),
//                             subtitle: Text('Dosen',
//                                 style: GoogleFonts.poppins(
//                                     fontSize: 14.0, color: Colors.black)),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Text('Teknik Informatika\nFASILKOM'),
//                               SizedBox(),
//                               Container(
//                                 padding: EdgeInsets.symmetric(vertical: 5),
//                                 width: 100,
//                                 decoration: BoxDecoration(
//                                     color: Colors.red[900],
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Center(
//                                     child: Text(
//                                   'UNSIKA',
//                                   style: GoogleFonts.poppins(
//                                       fontSize: 16.0, color: Colors.white),
//                                 )),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 8,
//                           ),
//                         ],
//                       ),
//                     );
