import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/channel_model.dart';
import '../models/video_model.dart';
import 'video_screen.dart';
import '../services/api_service.dart';

class ChannelView extends StatefulWidget {
  ChannelView(
      {Key? key,
      required this.playlistId,
      required this.channelId,
      required this.channelName})
      : super(key: key);

  final playlistId;
  final channelId;
  final channelName;
  @override
  _ChannelViewState createState() => _ChannelViewState();
}

class _ChannelViewState extends State<ChannelView> {
  Channel? _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance.fetchChannel(
        channelId: widget.channelId, playlistId: widget.playlistId);
    if (mounted) {
      setState(() {
        _channel = channel;
      });
    }
  }

  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
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
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel!.profilePictureUrl),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel!.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel!.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Color.fromARGB(153, 235, 235, 245),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return video.title != "Private video"
        ? GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => VideoScreen(id: video.id),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              padding: EdgeInsets.all(10.0),
              height: 140.0,
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
                  video.thumbnailUrl != "null"
                      ? Image(
                          width: 150.0,
                          image: NetworkImage(video.thumbnailUrl),
                        )
                      : Container(
                          width: 150.0,
                        ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      video.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }

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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF1C1C1E),
          ),
        ),
        title: Text(widget.channelName,
            style: GoogleFonts.breeSerif(
              fontSize: 22.0,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      // ignore: unnecessary_null_comparison
      body: Container(
        color: Color(0xFF1C1C1E),
        child: _channel != null
            ? NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollDetails) {
                  if (!_isLoading &&
                      _channel!.videos.length !=
                          int.parse(_channel!.videoCount) &&
                      scrollDetails.metrics.pixels ==
                          scrollDetails.metrics.maxScrollExtent) {}
                  return false;
                },
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 1 + _channel!.videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return _buildProfileInfo();
                    }
                    Video video = _channel!.videos[index - 1];
                    return _buildVideo(video);
                  },
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor, // Red
                  ),
                ),
              ),
      ),
    );
  }
}
