import 'package:flutter/material.dart';

class VideoItemView extends StatefulWidget {
  VideoItemView({required this.url,Key? key,}) : super(key: key);
  final String url;

  @override
  State<VideoItemView> createState() => _VideoItemViewState();
}

class _VideoItemViewState extends State<VideoItemView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
