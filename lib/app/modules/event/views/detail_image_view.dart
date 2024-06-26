import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class DetailImageView extends GetView {
  DetailImageView({
    required this.img,
    required this.tagHero,
    Key? key,
  }) : super(key: key);

  final String img;
  final String tagHero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Hero(
            transitionOnUserGestures: true,
            tag: tagHero,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: Get.width * (16 / 9),
              ),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: PhotoView(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  minScale: PhotoViewComputedScale.contained * 1,
                  maxScale: PhotoViewComputedScale.covered * 4,
                  imageProvider: CachedNetworkImageProvider(img),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
