import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/event/views/detail_image_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../plugin/pdfViewDetail.dart';
import '../controllers/event_controller.dart';

class EventDataView extends StatelessWidget {
  const EventDataView({
    Key? key,
    required this.controller,
    required BuildContext context,
  }) : super(key: key);

  final EventController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PostgrestResponse<dynamic>>(
      future: controller.getEvent(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List datas = jsonDecode(jsonEncode(snapshot.data?.data));
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            itemCount: datas.length,
            itemBuilder: (context, index) {
              return ExpandableNotifier(
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 15, left: 8, right: 8, top: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                    // clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () => Get.to(
                              () => DetailImageView(
                                img: datas[index]['img'],
                                tagHero:
                                    '${datas[index]["id"]}${datas[index]['title']}',
                              ),
                            ),
                            child: Hero(
                              tag:
                                  '${datas[index]["id"]}${datas[index]['title']}',
                              child: CachedNetworkImage(
                                imageUrl: datas[index]['img'],
                                cacheKey:
                                    '${datas[index]["id"]}${datas[index]['title']}',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  margin: EdgeInsets.only(
                                      left: 8, right: 8, bottom: 5),
                                  width: Get.width * 1,
                                  height: Get.width * 1.5,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3.0,
                                          offset: Offset(1.0, 1.0),
                                          spreadRadius: 1.0),
                                      BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 3.0,
                                          offset: Offset(-1.0, -1.0),
                                          spreadRadius: 1.0)
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
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
                              iconColor: Color.fromARGB(214, 0, 0, 0),
                              inkWellBorderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            header: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                datas[index]['title'],
                                maxLines: 2,
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(214, 0, 0, 0),
                                ),
                              ),
                            ),
                            collapsed: Text(
                              datas[index]['sub_title'],
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 16,
                                color: Color.fromARGB(214, 0, 0, 0),
                              ),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            expanded: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  datas[index]['sub_title'] + "\n",
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 16,
                                    color: Color.fromARGB(214, 0, 0, 0),
                                  ),
                                ),
                                Text(
                                  datas[index]['detail']
                                      .replaceAll(r'\n', '\n'),
                                  style: GoogleFonts.sourceSansPro(
                                    fontSize: 16,
                                    color: Color.fromARGB(214, 0, 0, 0),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PdfViewDetail(
                                          book: datas[index]['pdf'],
                                          title: datas[index]['title'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        "assets/icon/book.gif",
                                        width: 32,
                                      ),
                                      SizedBox(width: 8),
                                      Text("Baca PDF"),
                                    ],
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
              // Container(
              //   margin: EdgeInsets.only(top: 10, left: 25, right: 25),
              //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(13.0),
              //       boxShadow: [
              //         BoxShadow(
              //             color: Colors.grey,
              //             blurRadius: 15.0,
              //             offset: Offset(4.0, 4.0),
              //             spreadRadius: 1.0),
              //         BoxShadow(
              //             color: Colors.white,
              //             blurRadius: 15.0,
              //             offset: Offset(-4.0, -4.0),
              //             spreadRadius: 1.0)
              //       ]),
              //   child: Column(
              //     // padding: EdgeInsets.all(20),
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           GestureDetector(
              //             onTap: () {
              //               Get.to(() => DetailImageView(
              //                     img: datas[index]['img'],
              //                     tagHero: '${datas[index]["id"]}',
              //                   ));
              //             },
              //             child: Hero(
              //               tag: '${datas[index]["id"]}',
              //               child: Image.network(
              //                 datas[index]['img'],
              //                 width: 75,
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             width: 15,
              //           ),
              //           Flexible(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   datas[index]['title'],
              //                   overflow: TextOverflow.ellipsis,
              //                   maxLines: 2,
              //                   // softWrap: false,
              //                   style: GoogleFonts.poppins(fontSize: 16.0),
              //                 ),
              //                 Text(
              //                   datas[index]['sub_title'],
              //                   overflow: TextOverflow.ellipsis,
              //                   maxLines: 1,
              //                   style: GoogleFonts.poppins(fontSize: 14.0),
              //                 ),
              //                 SizedBox(
              //                   height: 8,
              //                 ),
              //                 Container(
              //                   height: 3,
              //                   color: Colors.grey[100],
              //                 ),
              //                 SizedBox(
              //                   height: 8,
              //                 ),
              //                 AutoSizeText(
              //                   datas[index]['detail'].replaceAll(r'\n', '\n'),
              //                   overflow: TextOverflow.ellipsis,
              //                   maxLines: 3,
              //                 ),
              //                 SizedBox(height: 5),
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.end,
              //                   children: [
              //                     Container(
              //                       margin: EdgeInsets.only(right: 10),
              //                       child: TextButton(
              //                         style: TextButton.styleFrom(
              //                           backgroundColor:
              //                               Color.fromARGB(185, 5, 88, 156),
              //                           shape: RoundedRectangleBorder(
              //                             borderRadius:
              //                                 BorderRadius.circular(5),
              //                           ),
              //                         ),
              //                         onPressed: () => controller.getAlert(
              //                             context,
              //                             datas[index]['title'],
              //                             datas[index]['sub_title'],
              //                             datas[index]['detail']),
              //                         child: Text(
              //                           "read",
              //                           style: TextStyle(
              //                             color: Color(0xffffffff),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );
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
    );
  }
}
