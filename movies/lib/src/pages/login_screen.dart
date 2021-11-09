import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:movies/src/pages/register_screen.dart';
import 'package:movies/src/widgets/auth_header.dart';
import 'package:movies/src/widgets/auth_rich_text.dart';
import 'package:movies/src/widgets/dismiss_keyboard.dart';
import 'package:movies/src/widgets/main_button.dart';
import 'package:movies/src/widgets/auth_text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  void onRichTextTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const RegisterScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: DismissKeyboard(
        child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AuthHeader(
                      title: 'Sign in',
                      imageWidth: MediaQuery
                          .of(context)
                          .size
                          .width * 0.95,
                      image: "assets/images/login.png",
                    ),
                    AuthTextInput(
                      hintText: "Email",
                      prefixIcon: Icons.email,
                      isSecured: false,
                      textController: _emailTextController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AuthTextInput(
                      hintText: "Password",
                      prefixIcon: Icons.lock,
                      isSecured: true,
                      textController: _passwordTextController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: MainButton(
                        buttonText: "SIGN IN",
                      ),
                    ),
                    AuthRichText(
                      content: "Not registered yet? ",
                      richContent: "Create an account",
                      onTap: () => onRichTextTap(context),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
