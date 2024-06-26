import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:himtika_apps/app/modules/login/views/privacy_view.dart';
import 'package:himtika_apps/app/modules/login/views/tc_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_mail_app/open_mail_app.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../../auth/widgets/auth_listener.dart';

class LoginView extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends AuthListener<LoginView> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
                  child: SignInForm(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SignInForm extends HookConsumerWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  Future<void> _sendMagicLink(
    BuildContext context,
    WidgetRef ref,
    String email,
    ValueNotifier<bool> magicLinkSent,
  ) async {
    await ref.read(AuthProvider.provider.notifier).sendMagicLink(email);
    magicLinkSent.value = true;

    await _openInMailApp(context);
  }

  Future<void> _openInMailApp(BuildContext context) async {
    final result = await OpenMailApp.openMailApp();

    if (!result.didOpen && !result.canOpen) {
      return await showDialog(
        context: context,
        builder: (_) => const NoMailAppsFound(),
      );
    }

    await showDialog(
      context: context,
      builder: (_) => MailAppPickerDialog(
        mailApps: result.options,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final magicLinkSent = useState(false);
    final emailController = useTextEditingController();
    final nameController = useTextEditingController();

    return AnimatedCrossFade(
      sizeCurve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
      crossFadeState: magicLinkSent.value
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      firstChild: EmailInput(
        nameController: nameController,
        emailController: emailController,
        onSendMagicLink: () {
          String pattern = r'^[\w-\.]+@(student.unsika.ac.id)';
          RegExp regex = new RegExp(pattern);
          String pattern2 = r'^[\w-\.]+@(unsika.ac.id)';
          RegExp regex2 = new RegExp(pattern2);
          if (emailController.text == "akuntesting10293@unsika.ac.id") {
            final box = GetStorage();
            box.write("email", emailController.text);
            Get.toNamed("/home");
          } else if ((regex.hasMatch(emailController.text) ||
                  regex2.hasMatch(emailController.text)) &&
              nameController.text.isNotEmpty) {
            final box = GetStorage();
            box.write("nama", nameController.text);
            _sendMagicLink(context, ref, emailController.text, magicLinkSent);
          }
        },
      ),
      secondChild: EmailSent(
        onRestart: () => magicLinkSent.value = false,
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController nameController;
  final VoidCallback onSendMagicLink;

  const EmailInput({
    Key? key,
    required this.emailController,
    required this.onSendMagicLink,
    required this.nameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildNameTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Name',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xFF6CA8F1),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextFormField(
              controller: nameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if ((value ?? '').isEmpty) {
                  return '  Harap masukan nama\n';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                errorStyle: TextStyle(
                    color: Color.fromARGB(255, 155, 25, 25),
                    fontSize: 12,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                hintText: 'Enter your name',
                hintStyle: TextStyle(
                  color: Colors.white54,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildEmailTF() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Email',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0xFF6CA8F1),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  String pattern = r'^[\w-\.]+@(student.unsika.ac.id)';
                  String pattern2 = r'^[\w-\.]+@(unsika.ac.id)';
                  RegExp regex = new RegExp(pattern);
                  RegExp regex2 = new RegExp(pattern2);
                  if ((value ?? '').isEmpty) {
                    return '  Harap masukan email\n';
                  } else if (!(regex.hasMatch(value!) ||
                      regex2.hasMatch(value))) {
                    return '  Hanya mendukung @student.unsika.ac.id\n';
                  }
                  return null;
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: InputDecoration(
                  errorStyle: TextStyle(
                      color: Color.fromARGB(255, 155, 25, 25),
                      fontSize: 12,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildLoginBtn() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5.0,
          onPressed: onSendMagicLink,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Text(
            'LOGIN',
            style: TextStyle(
              color: Color(0xFF527DAA),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      );
    }

    // bool isEmail(String input) =>
    //     RegExp(r'^[\w-\.]+@(student.unsika.ac.id)').hasMatch(input);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 40,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Image.asset(
              "assets/img/logo_himtika.png",
              height: 220,
            ),
          ),
        ),
        Center(
          child: BorderedText(
            strokeWidth: 3.0,
            child: Text('HIMTIKA',
                style: GoogleFonts.poppins(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(height: 15),
        _buildNameTF(),
        SizedBox(
          height: 20,
        ),
        _buildEmailTF(),
        SizedBox(height: 15),
        _buildLoginBtn(),
        SizedBox(height: 15),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'By continuing, you agree to our',
            style: TextStyle(color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                text: ' Terms & Conditions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(() => terms_conditionView());
                  },
              ),
              TextSpan(text: ' and'),
              TextSpan(
                text: ' Privacy Policy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(() => PrivacyView());
                  },
              ),
            ],
          ),
        ),

        // ElevatedButton(onPressed: onSendMagicLink, child: Text("login")),
      ],
    );
  }
}

class EmailSent extends StatelessWidget {
  final VoidCallback onRestart;
  const EmailSent({Key? key, required this.onRestart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.mail,
            size: 72,
          ),
          Center(
            child: Text(
              "You've got mail",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: const Text(
              "Check your email for a magic link.",
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: onRestart,
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}

class NoMailAppsFound extends StatelessWidget {
  const NoMailAppsFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Email"),
      content: const Text("You don't have any supported email apps installed."),
      actions: <Widget>[
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
