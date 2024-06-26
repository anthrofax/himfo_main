import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/anonymous_chat/controllers/anonymous_chat_controller.dart';
import 'package:himtika_apps/app/modules/anonymous_chat/models/Pesan.dart';
import 'package:himtika_apps/app/modules/anonymous_chat/views/admin_view.dart';
import 'package:himtika_apps/app/modules/anonymous_chat/views/anonymous_chat_private.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/Pesan.dart';
import 'BadWord.dart';

class AnonymousChatView extends StatefulWidget {
  AnonymousChatView({Key? key}) : super(key: key);

  @override
  State<AnonymousChatView> createState() => _AnonymousChatViewState();
}

class _AnonymousChatViewState extends State<AnonymousChatView> {
  AnonymousChatController controller = AnonymousChatController();
  List<Pesan> messages = [];
  late RealtimeSubscription messageSubcription;
  late TextEditingController newTaskName;

  @override
  void initState() {
    super.initState();

    newTaskName = TextEditingController();

    setupmessageSubcription();

    Future.microtask(() async {
      final _messages = await getInitialTodos();
      if (mounted) {
        setState(() {
          messages = _messages;
        });
      }
    });
  }

  String timestampToDate(String timestamps) {
    initializeDateFormatting('id', null);
    DateTime date = DateTime.parse(timestamps).toLocal();
    return DateFormat("HH:mm, dd MMM", 'id').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String admin = box.read("admin");

    final messageWidgets = messages
        .map(
          (pesan) => Bubble(
            margin: BubbleEdges.only(top: 10),
            padding: BubbleEdges.all(10),
            alignment: Alignment.topLeft,
            nip: BubbleNip.leftTop,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  BadWord().KataKotor(pesan.message),
                  style: GoogleFonts.notoSans(
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
                Text(
                  timestampToDate(pesan.created_at),
                  style: GoogleFonts.notoSans(
                    textStyle: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();

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
          "Anonymous Chat",
          style: GoogleFonts.breeSerif(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          admin == "false"
              ? Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(PrivateMode());
                    },
                    child: Icon(
                      Icons.private_connectivity,
                      size: 26.0,
                    ),
                  ),
                )
              : Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(PrivateMode());
                        },
                        child: Icon(
                          Icons.private_connectivity,
                          size: 26.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(AdminView());
                        },
                        child: Icon(
                          Icons.admin_panel_settings,
                          size: 26.0,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/wp.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListView(
                      reverse: true,
                      physics: BouncingScrollPhysics(),
                      children: [...messageWidgets])),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: newTaskName,
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Message...",
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Color(0xFF2193b0),
                    ),
                    onPressed: addTask,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Pesan>> getInitialTodos() async {
    final response = await Supabase.instance.client
        .from('anonymous_chat')
        .select()
        .order('created_at', ascending: false)
        .limit(200)
        .execute();

    final dataList = response.data as List;
    return dataList.map((map) => Pesan.fromJson(map)).toList();
  }

  void setupmessageSubcription() {
    messageSubcription = Supabase.instance.client
        .from('anonymous_chat')
        .on(SupabaseEventTypes.all, (payload) {
      handleInsert(payload);
    }).subscribe();
  }

  void handleInsert(payload) {
    final pesan = Pesan.fromJson(payload.newRecord);
    // messa.sort((a,b) => a.compareTo(b));
    if (mounted) {
      setState(() {
        messages = [pesan, ...messages];
        messages.sort((a, b) => b.id.compareTo(a.id));
      });
    }
  }

  Future addTask() async {
    if (newTaskName.text.isEmpty) {
    } else {
      String kata = BadWord().KataKotor(newTaskName.text);
      Supabase.instance.client
          .from('anonymous_chat')
          .insert({'message': kata}).execute();
      controller.sendForAll("Anonymous Chat [Pesan baru]", newTaskName.text);
      if (mounted) {
        setState(() {
          newTaskName.text = '';
        });
      }
    }
  }
}
