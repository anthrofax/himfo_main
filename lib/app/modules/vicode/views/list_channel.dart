import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:himtika_apps/app/modules/vicode/controllers/vicode_controller.dart';
import 'package:himtika_apps/app/modules/vicode/views/channel_view.dart';
import '../models/channel_model.dart';
import '../services/api_service.dart';

class ListChannel extends StatefulWidget {
  @override
  _ListChannelState createState() => _ListChannelState();
}

class _ListChannelState extends State<ListChannel> {
  VicodeController controller = VicodeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF1C1C1E),
        child: FutureBuilder<List>(
          future: controller.getPlaylist(),
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
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  Channel? channel;
                  _initChannel(String channelId) async {
                    channel = await APIService.instance
                        .getChannelList(channelId: channelId);
                    return channel;
                  }

                  return InkWell(
                    onTap: () {
                      Get.to(ChannelView(
                        playlistId: data[index]['id_playlist'],
                        channelId: data[index]['id_channel'],
                        channelName: data[index]['pemrograman'],
                      ));
                    },
                    child: FutureBuilder(
                      future: _initChannel(data[index]['id_channel']),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        // String? profile =
                        //     channel?.profilePictureUrl.toString();
                        if (snapshot.data == null) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(),
                            ],
                          );
                        } else {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
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
                                  backgroundImage: NetworkImage(
                                      (channel?.profilePictureUrl).toString()),
                                ),
                                SizedBox(width: 12.0),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        data[index]['pemrograman'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        (channel?.title).toString(),
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              153, 235, 235, 245),
                                          fontSize: 16.0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '${channel?.subscriberCount} subscribers',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              153, 235, 235, 245),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      // ListView.builder(
      //   itemBuilder: (context, index) {
      //     return _buildProfileInfo();
      //   },
      // ),
    );
  }
}
