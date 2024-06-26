import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/proker/controllers/proker_controller.dart';

class DataProker extends StatefulWidget {
  DataProker({Key? key}) : super(key: key);

  @override
  State<DataProker> createState() => _DataProkerState();
}

class _DataProkerState extends State<DataProker> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProkerController controller = ProkerController();

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 228, 228, 233),
        child: FutureBuilder<List>(
          future: controller.getProker(),
          builder: (context, snapshot) {
            List? data = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
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
                itemCount: data!.length == null ? 0 : snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(13.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 39, 137, 216),
                            offset: Offset(2.0, 2.0),
                            spreadRadius: 1.0),
                        BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            offset: Offset(-1.0, -1.0),
                            spreadRadius: 1.0)
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.menu_book_rounded,
                              size: 35.0,
                              color: Color(0xFF398AE5),
                            ),
                            title: Text(
                              data[index]['name'],
                              style: GoogleFonts.sourceSansPro(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              data[index]['divisi'],
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                            onTap: () {},
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'HIMTIKA',
                                    style: GoogleFonts.breeSerif(
                                      fontSize: 14.0,
                                      color: Color(0xFF398AE5),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Proker 2022 ',
                                        style: GoogleFonts.breeSerif(
                                          fontSize: 14.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        '©',
                                        style: GoogleFonts.breeSerif(
                                          fontSize: 16.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(),
                              InkWell(
                                onTap: () {
                                  AwesomeDialog(
                                    context: context,
                                    animType: AnimType.SCALE,
                                    dialogType: DialogType.INFO,
                                    btnOkColor: Color(0xFF398AE5),
                                    body: Center(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Text(
                                              data[index]['name'],
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text(
                                              data[index]['detail'],
                                              overflow: TextOverflow.visible,
                                              style: GoogleFonts.sourceSansPro(
                                                textStyle:
                                                    TextStyle(fontSize: 16),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    btnOkOnPress: () {},
                                  )..show();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF398AE5),
                                    // gradient: LinearGradient(
                                    //   begin: Alignment.topCenter,
                                    //   end: Alignment.bottomCenter,
                                    //   colors: [
                                    //     Color(0xFF2193b0),
                                    //     Color(0xFF6dd5ed),
                                    //   ],
                                    // ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'show more',
                                    style: GoogleFonts.breeSerif(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
