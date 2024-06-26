import 'dart:convert';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../controllers/information_controller.dart';

class InformationView extends GetView<InformationController> {
  @override
  Widget build(BuildContext context) {
    // const Color one = Color.fromARGB(64, 19, 105, 55);
    // const Color two = Color.fromARGB(64, 16, 28, 99);
    // const Color three = Color.fromARGB(64, 105, 18, 47);
    // const Color four = Color.fromARGB(64, 18, 77, 100);
    // const Color five = Color.fromARGB(64, 18, 107, 58);
    // const Color six = Color.fromARGB(64, 71, 102, 14);
    // const Color seven = Color.fromARGB(64, 119, 53, 15);
    // List<Color> hexColor = [one, two, three, four, five, six, seven];

    // final _random = Random();

    // Color colorRandom() {
    //   return hexColor[Random().nextInt(7)];
    // }
    String timestampToDate(String timestamps) {
      initializeDateFormatting('id', null);
      DateTime date = DateTime.parse(timestamps).toLocal();
      return DateFormat("HH:mm - dd MMM y", 'id').format(date);
    }

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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 39, 137, 216),
          ),
        ),
        title: Text('Information',
            style: GoogleFonts.breeSerif(
              fontSize: 22.0,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height * 1,
        color: Color.fromARGB(255, 242, 242, 246),
        child: FutureBuilder<PostgrestResponse<dynamic>>(
          future: controller.getEvent(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List datas = jsonDecode(jsonEncode(snapshot.data?.data));
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: datas.length,
                itemBuilder: (context, index) {
                  // final text = Color.fromARGB(235, 0, 0, 0);
                  return ExpandableNotifier(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          color: Color.fromARGB(206, 39, 136, 216),
                          // gradient: LinearGradient(
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.topRight,
                          //   colors: [
                          //     Color(0xFF2193b0),
                          //     Color(0xFF6dd5ed),
                          //   ],
                          // ),
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
                        // clipBehavior: Clip.antiAlias,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                timestampToDate(datas[index]['created_at']),
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ScrollOnExpand(
                              scrollOnExpand: true,
                              scrollOnCollapse: false,
                              child: ExpandablePanel(
                                theme: const ExpandableThemeData(
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  tapBodyToCollapse: true,
                                  tapBodyToExpand: true,
                                  iconColor: Color.fromARGB(255, 255, 255, 255),
                                  inkWellBorderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                header: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  child: Text(
                                    datas[index]['title'],
                                    maxLines: 2,
                                    style: GoogleFonts.sourceSansPro(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                collapsed: Text(
                                  datas[index]['subtitle'] +
                                      "\n\n" +
                                      datas[index]['isi'],
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                expanded: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      datas[index]['subtitle'] +
                                          "\n\n" +
                                          datas[index]['isi'],
                                      style: GoogleFonts.sourceSansPro(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                builder: (_, collapsed, expanded) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    child: Expandable(
                                      collapsed: collapsed,
                                      expanded: expanded,
                                      theme: const ExpandableThemeData(
                                          crossFadePoint: 0),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
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
          },
        ),
      ),
    );
  }
}
