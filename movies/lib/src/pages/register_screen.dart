import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:movies/src/controllers/authentication_controller.dart';
import 'package:movies/src/pages/login_screen.dart';
import 'package:movies/src/widgets/auth_header.dart';
import 'package:movies/src/widgets/auth_rich_text.dart';
import 'package:movies/src/widgets/classic_alert_dialog.dart';
import 'package:movies/src/widgets/dismiss_keyboard.dart';
import 'package:movies/src/widgets/main_button.dart';
import 'package:movies/src/widgets/auth_text_input.dart';
import 'package:movies/src/widgets/shake_animated_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'navigation_screen.dart';

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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailError = false;
    _passwordError = false;
    _usernameError = false;
    _isLoading = false;
  }

  bool isEmailValid() {
    bool validation = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailTextController.text);

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

  void onRegisterPressed(BuildContext context) {
    // check if all form values are valid
    bool usernameError = isUsernameValid();
    bool emailError = isEmailValid();
    bool passwordError = isPasswordValid();

    // if the form value is not valid, trigger the shake animation
    usernameError ? _shakeKeyUsername.currentState?.shake() : null;
    emailError ? _shakeKeyEmail.currentState?.shake() : null;
    passwordError ? _shakeKeyPassword.currentState?.shake() : null;

    // if all values are valid, register
    if (!usernameError && !emailError && !passwordError) {
      setState(() {
        _isLoading = true;
      });

      register(http.Client(), _usernameTextController.text, _emailTextController.text,
              _passwordTextController.text)
          .then((token) async {
        SharedPreferences s = await SharedPreferences.getInstance();

        print(token.jwt);
        s.setString("jwt", token.jwt);

        setState(() {
          _isLoading = false;
        });

        // navigate to the home screen of the app
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const NavigationScreen();
        }));

      }).catchError((e) {
        setState(() {
          _isLoading = false;
        });

        _showErrorDialog(context, e);
      });
    }
  }

  void _showErrorDialog(BuildContext context, Exception e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ClassicAlertDialog(
            title: "Error",
            content: e.toString().substring(11),
            buttonText: "OK",
          onPressed: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
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
                  imageWidth: MediaQuery.of(context).size.width * 0.95,
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
                    onPressed: () => onRegisterPressed(context),
                    isLoading: _isLoading,
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
