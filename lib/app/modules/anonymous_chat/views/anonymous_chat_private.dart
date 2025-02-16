import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/anonymous_chat/controllers/anonymous_chat_controller.dart';
import 'package:himtika_apps/app/modules/anonymous_chat/models/PesanPrivate.dart';
import 'package:himtika_apps/app/modules/anonymous_chat/views/BadWord.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PrivateMode extends StatefulWidget {
  PrivateMode({Key? key}) : super(key: key);

  @override
  State<PrivateMode> createState() => _PrivateModeState();
}

class _PrivateModeState extends State<PrivateMode> {
  List<PesanPrivate> messages = [];
  late RealtimeSubscription messageSubcription;
  late TextEditingController newTaskName;
  AnonymousChatController controller = AnonymousChatController();

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
    final messageWidgets = messages
        .map(
          (pesan) => pesan.admin == 0
              ? Bubble(
                  margin: BubbleEdges.only(top: 5, bottom: 5),
                  padding: BubbleEdges.all(10),
                  alignment: Alignment.topRight,
                  nip: BubbleNip.rightTop,
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
                          textStyle:
                              TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                )
              : Bubble(
                  margin: BubbleEdges.only(top: 5, bottom: 5),
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
                          textStyle:
                              TextStyle(fontSize: 12, color: Colors.grey),
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
          "Private Chat",
          style: GoogleFonts.breeSerif(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/wp.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListView(
                  reverse: true,
                  physics: BouncingScrollPhysics(),
                  children: [...messageWidgets],
                ),
              ),
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

  Future<List<PesanPrivate>> getInitialTodos() async {
    final box = GetStorage();
    String email = box.read("email");
    final response = await Supabase.instance.client
        .from('anonymous_chat_private')
        .select()
        .or('user_from.eq.${email},to.eq.${email}')
        .order('created_at', ascending: false)
        .limit(200)
        .execute();

    final dataList = response.data as List;
    return dataList.map((map) => PesanPrivate.fromJson(map)).toList();
  }

  void setupmessageSubcription() {
    messageSubcription = Supabase.instance.client
        .from('anonymous_chat_private')
        .on(SupabaseEventTypes.all, (payload) {
      handleInsert(payload);
    }).on(SupabaseEventTypes.update, (payload) {
      handleUpdate(payload);
    }).subscribe();
  }

  void handleInsert(payload) {
    final pesan = PesanPrivate.fromJson(payload.newRecord);
    // messa.sort((a,b) => a.compareTo(b));
    if (mounted) {
      setState(() {
        messages = [pesan, ...messages];
        messages.sort((a, b) => b.id.compareTo(a.id));
      });
    }
  }

  Future addTask() async {
    final box = GetStorage();
    String? email = box.read("email");
    String? user_notification = box.read("playerIdOneSignal");

    if (newTaskName.text.isEmpty) {
    } else {
      Supabase.instance.client.from('anonymous_chat_private').insert({
        'message': newTaskName.text,
        'user_from': email,
        'to': 'all',
        'admin': 0,
        'read': "false",
        'user_id_notification': user_notification,
      }).execute();
      controller.sendForAdmin("Ada pesan baru untuk kamu!", newTaskName.text);
      if (mounted) {
        setState(() {
          newTaskName.text = '';
        });
      }
    }
  }

  void handleUpdate(payload) {
    final updatePesan = PesanPrivate.fromJson(payload.newRecord);
    final pesan = messages.firstWhere((t) => t.id == updatePesan.id);
    setState(() {
      messages = [pesan, ...messages];
      messages.sort((a, b) => b.id.compareTo(a.id));
    });
  }
}
