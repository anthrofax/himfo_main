import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/hicode/controllers/hicode_controller.dart';
import 'package:himtika_apps/app/modules/hicode/views/detail_view.dart';

class PartCodingView extends GetView {
  PartCodingView({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    HicodeController controller = HicodeController();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1C1C1E),
          ),
        ),
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
        title: Text(
          title,
          style: GoogleFonts.breeSerif(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          // color: Color.fromARGB(185, 5, 88, 156),
          color: Color(0xFF1C1C1E),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: FutureBuilder<List>(
          future: controller.getHicode(title.toString()),
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
              if (data!.isEmpty)
                return Center(
                  child: Text(
                    "Saat ini materi ${title} belum tersedia",
                    style: TextStyle(
                      color: Color.fromARGB(220, 235, 235, 245),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Get.to(DetailView(
                        title: data[index]['judul'],
                        html: data[index]['html'])),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(102, 112, 112, 112),
                        borderRadius: BorderRadius.circular(13.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 1),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  data[index]['judul'],
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 255, 255, 255),
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
