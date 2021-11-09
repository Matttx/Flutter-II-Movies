import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:movies/src/pages/login_screen.dart';
import 'package:movies/src/widgets/auth_header.dart';
import 'package:movies/src/widgets/auth_rich_text.dart';
import 'package:movies/src/widgets/dismiss_keyboard.dart';
import 'package:movies/src/widgets/main_button.dart';
import 'package:movies/src/widgets/auth_text_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();

  void onRichTextTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const LoginScreen();
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
                      title: 'Create account',
                      imageWidth: MediaQuery
                          .of(context)
                          .size
                          .width * 0.95,
                      image: "assets/images/register.png",
                    ),
                    AuthTextInput(
                      hintText: "Username",
                      prefixIcon: Icons.person,
                      isSecured: false,
                      textController: _usernameTextController,
                    ),
                    const SizedBox(
                      height: 10,
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
                        buttonText: "REGISTER",
                      ),
                    ),
                    AuthRichText(
                      content: "Already registered? ",
                      richContent: "Sign in",
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