import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:movies/src/pages/login_screen.dart';
import 'package:movies/src/widgets/auth_header.dart';
import 'package:movies/src/widgets/auth_rich_text.dart';
import 'package:movies/src/widgets/dismiss_keyboard.dart';
import 'package:movies/src/widgets/main_button.dart';
import 'package:movies/src/widgets/auth_text_input.dart';
import 'package:movies/src/widgets/shake_animated_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  final _shakeKeyEmail = GlobalKey<ShakeWidgetState>();
  final _shakeKeyPassword = GlobalKey<ShakeWidgetState>();
  final _shakeKeyUsername = GlobalKey<ShakeWidgetState>();

  bool _emailError = false;
  bool _passwordError = false;
  bool _usernameError = false;

  @override
  void initState() {
    super.initState();
    _emailError = false;
    _passwordError = false;
    _usernameError = false;
  }

  bool isEmailValid() {
    bool validation = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailTextController.text);

    setState(() {
      _emailError = !validation;
    });

    return !validation;
  }

  bool isUsernameValid() {
    bool validation = _usernameTextController.text.trim().isNotEmpty;

    setState(() {
      _usernameError = !validation;
    });

    return !validation;
  }

  bool isPasswordValid() {
    bool validation = _passwordTextController.text.trim().isNotEmpty;

    setState(() {
      _passwordError = !validation;
    });

    return !validation;
  }

  void onRegisterPressed() {
    isUsernameValid() ? _shakeKeyUsername.currentState?.shake() : null;
    isEmailValid() ? _shakeKeyEmail.currentState?.shake() : null;
    isPasswordValid() ? _shakeKeyPassword.currentState?.shake() : null;
  }

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
                    ShakeWidget(
                      key: _shakeKeyUsername,
                      shakeCount: 3,
                      shakeOffset: 6,
                      shakeDuration: const Duration(milliseconds: 400),
                      child: AuthTextInput(
                        hintText: "Username",
                        prefixIcon: Icons.person,
                        isSecured: false,
                        textController: _usernameTextController,
                        error: _usernameError,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ShakeWidget(
                      key: _shakeKeyEmail,
                      shakeCount: 3,
                      shakeOffset: 6,
                      shakeDuration: const Duration(milliseconds: 400),
                      child: AuthTextInput(
                        hintText: "Email",
                        prefixIcon: Icons.email,
                        isSecured: false,
                        textController: _emailTextController,
                        error: _emailError,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ShakeWidget(
                      key: _shakeKeyPassword,
                      shakeCount: 3,
                      shakeOffset: 6,
                      shakeDuration: const Duration(milliseconds: 400),
                      child: AuthTextInput(
                        hintText: "Password",
                        prefixIcon: Icons.lock,
                        isSecured: true,
                        textController: _passwordTextController,
                        error: _passwordError,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: MainButton(
                        buttonText: "REGISTER",
                        onPressed: () => onRegisterPressed(),
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