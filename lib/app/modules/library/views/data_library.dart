import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/library/controllers/library_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../plugin/pdfViewDetail.dart';

class DataLibrary extends StatefulWidget {
  DataLibrary({Key? key}) : super(key: key);

  @override
  State<DataLibrary> createState() => _DataLibraryState();
}

class _DataLibraryState extends State<DataLibrary> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LibraryController controller = LibraryController();

    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            width: double.infinity,
            color: Color.fromARGB(255, 39, 137, 216),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Rekomendasi",
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Container(
            color: Color.fromARGB(255, 39, 137, 216),
            height: Get.width * 0.6,
            child: FutureBuilder<List>(
              future: controller.getLibraryRecomended(),
              builder: (context, snapshot) {
                List? data = snapshot.data;
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PdfViewDetail(
                                book: data[index]['book'],
                                title: data[index]['title'],
                              ),
                            ),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: data[index]['thumbnail'],
                            imageBuilder: (context, imageProvider) => Container(
                              padding: EdgeInsets.all(0),
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, bottom: 20),
                              width: Get.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          topLeft: Radius.circular(10)),
                                    ),
                                    height: 25,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(10),
                                            ),
                                          ),
                                          padding: EdgeInsets.all(5),
                                          child: Text(
                                            data[index]['subtitle'],
                                            style: GoogleFonts.sourceSansPro(
                                              textStyle: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromARGB(
                                                    214, 19, 19, 19),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),
                                    width: Get.width * 1,
                                    height: 45,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Center(
                                      child: Text(
                                        data[index]['title']
                                            .toString()
                                            .toUpperCase(),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.sourceSansPro(
                                          textStyle: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Color.fromARGB(214, 19, 19, 19),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        );
                      },
                    ),
                  );
                }
                return ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    shimmerDumy(),
                    shimmerDumy(),
                    shimmerDumy(),
                    shimmerDumy(),
                    shimmerDumy(),
                  ],
                );
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 6,
                width: Get.width * 0.3,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 242, 246),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Container(
            height: Get.height * 0.86,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 242, 242, 246),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24, top: 8),
                      child: Text(
                        "All Books",
                        style: GoogleFonts.sourceSansPro(
                          textStyle:
                              TextStyle(color: Colors.black87, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder<List>(
                      future: controller.getLibrary(),
                      builder: (context, snapshot) {
                        List? data = snapshot.data;
                        if (snapshot.data == null) {
                          return Container(
                            height: double.infinity,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                shimmerDumy2(),
                                shimmerDumy2(),
                                shimmerDumy2(),
                              ],
                            ),
                          );
                        }

                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PdfViewDetail(
                                          book: data[index]['book'],
                                          title: data[index]['title'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 4.0),
                                    height: 180,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(10.0),
                                          height: 180,
                                          width: 160,
                                          child: Container(
                                            height: 180,
                                            width: 160,
                                            decoration: BoxDecoration(),
                                            child: Image.network(
                                              data[index]["thumbnail"],
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0)),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                data[index]['title'],
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                        fontSize: 16.0,
                                                        color: Color.fromARGB(
                                                            180, 0, 0, 0),
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              Text(
                                                data[index]['subtitle'],
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  fontSize: 16.0,
                                                  color: Color.fromARGB(
                                                      255, 105, 102, 102),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color.fromARGB(180, 0, 0, 0),
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class shimmerDumy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 194, 192, 192),
      highlightColor: Color.fromARGB(255, 245, 244, 244),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        width: Get.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage("assets/img/thumbnail.jpg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class shimmerDumy2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(255, 194, 192, 192),
      highlightColor: Color.fromARGB(255, 245, 244, 244),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              height: 180,
              width: 160,
              child: Container(
                height: 200,
                width: 160,
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/img/thumbnail.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10.0)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 12,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 12,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
