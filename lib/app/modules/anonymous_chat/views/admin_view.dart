import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/anonymous_chat/views/anonymous_chat_private_admin.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'BadWord.dart';

class AdminView extends StatefulWidget {
  AdminView({Key? key}) : super(key: key);

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  String timestampToDate(String timestamps) {
    initializeDateFormatting('id', null);
    DateTime date = DateTime.parse(timestamps).toLocal();
    return DateFormat("HH:mm, dd MMM", 'id').format(date);
  }

  _getRequests() async {}
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
            color: Color(0xFF398AE5),
          ),
        ),
        title: Text(
          "Admin",
          style: GoogleFonts.breeSerif(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: StreamBuilder(
          stream: Supabase.instance.client
              .from('chat_filter')
              .stream(['user_from'])
              .order("created_at", ascending: false)
              .execute(),
          builder: (context, snapshot) {
            List? data = jsonDecode(jsonEncode(snapshot.data));
            if (!snapshot.hasData) {
              const Text('Loading...');
            } else {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  if (data[index]['read'] == "false") {
                    return GestureDetector(
                      onTap: () => Get.to(PrivateModeAdmin(
                        emailUser: data[index]['user_from'],
                        id: data[index]['id'],
                        id_notification: data[index]['user_id_notification'],
                      )),
                      child: Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(64, 75, 96, .9)),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 2.0),

                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                // Icon(
                                //   Icons.linear_scale_sharp,
                                //   color: Colors.white,
                                // ),
                                Text(
                                  "[" +
                                      timestampToDate(
                                          data[index]['created_at']) +
                                      "] : " +
                                      BadWord().KataKotor(
                                          data[index]['message'].toString()),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                            subtitle: Row(
                              children: <Widget>[
                                Icon(Icons.linear_scale, color: Colors.red),
                                Text("Admin belum merespon",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(
                              new MaterialPageRoute(
                                builder: (_) => new PrivateModeAdmin(
                                  emailUser: data[index]['user_from'],
                                  id: data[index]['id'],
                                  id_notification: data[index]
                                      ['user_id_notification'],
                                ),
                              ),
                            )
                            .then((val) => val ? _getRequests() : null);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => PrivateModeAdmin(
                        //       emailUser: data[index]['user_from'],
                        //       id: data[index]['id'],
                        //     ),
                        //   ),
                        // ).then(
                        //   (_) {
                        //     // This block runs when you have returned back from screen 2.
                        //     setState(
                        //       () {
                        //         // code here to refresh data
                        //         // controller.getTask();
                        //       },
                        //     );
                        // },
                        // );
                      },
                      // onTap: () => Get.to(PrivateModeAdmin(
                      //   emailUser: data[index]['user_from'],
                      //   id: data[index]['id'],
                      // )),
                      child: Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(157, 2, 3, 3)),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 2.0),

                            title: Text(
                              "[" +
                                  timestampToDate(data[index]['created_at']) +
                                  "] : " +
                                  BadWord().KataKotor(
                                      data[index]['message'].toString()),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                            subtitle: Row(
                              children: <Widget>[
                                Icon(Icons.linear_scale, color: Colors.green),
                                Text("Admin sudah merespon",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
