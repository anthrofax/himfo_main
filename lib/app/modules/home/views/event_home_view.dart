import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:himtika_apps/app/modules/home/controllers/home_controller.dart';
import 'package:shimmer/shimmer.dart';

import '../../event/views/detail_image_view.dart';

// ignore: must_be_immutable
class EventHomeView extends GetView {
  HomeController controller = HomeController();

  BuildContext contextEvent;
  EventHomeView({Key? key, required this.contextEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List>(
        future: controller.getEvent(),
        builder: (context, snapshot) {
          List? data = snapshot.data;

          if (snapshot.data == null) {
            return Container(
              child: Row(
                children: [
                  shimmerDumy(),
                  shimmerDumy(),
                  shimmerDumy(),
                ],
              ),
            );
          }
          return Container(
            // padding: EdgeInsets.only(left: 20),
            height: Get.width * 0.9,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              // ignore: unnecessary_null_comparison
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.to(() => DetailImageView(
                        img: data[index]['img'],
                        tagHero: '${data[index]["id"]}${data[index]['title']}',
                      )),
                  child: Hero(
                    tag: '${data[index]["id"]}${data[index]['title']}',
                    child: CachedNetworkImage(
                      imageUrl: data[index]['img'],
                      cacheKey: '${data[index]["id"]}${data[index]['title']}',
                      imageBuilder: (context, imageProvider) => Container(
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        width: Get.width * 0.5,
                        height: Get.width * 0.9,
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
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                );
              },
            ),
          );
        },
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
        margin: EdgeInsets.only(left: 20),
        width: Get.width * 0.5,
        height: Get.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}



// Shimmer.fromColors(
//       baseColor: Color.fromARGB(255, 230, 227, 227),
//       highlightColor: Color.fromARGB(255, 245, 244, 244),
//       child: Container(
//         margin: EdgeInsets.all(10),
//         width: Get.width * 0.6,
//         height: Get.width * 1,
//         decoration: BoxDecoration(
//           border: Border.all(width: 1),
//           image: DecorationImage(
//               image: AssetImage(
//                 'assets/img/pamflet.png',
//               ),
//               fit: BoxFit.fill),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [Text("data")],
//         ),
//       ),
//     );