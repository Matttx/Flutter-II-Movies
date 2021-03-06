import 'package:flutter/material.dart';
import 'package:movies/src/theme/app_colors.dart';

class AuthTextInput extends StatefulWidget {
  const AuthTextInput(
      {Key? key,
      this.prefixIcon,
      this.prefixIconColor = AppColors.primary,
      this.prefixIconSize = 20,
      required this.hintText,
      required this.isSecured,
      required this.textController,
      required this.error})
      : super(key: key);

  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final String hintText;
  final bool isSecured;
  final TextEditingController textController;
  final bool error;

  @override
  _AuthTextInputState createState() => _AuthTextInputState();
}

class _AuthTextInputState extends State<AuthTextInput> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: widget.error ? Border.all(color: AppColors.red) : null),
        child: TextField(
          cursorColor: AppColors.black,
          controller: widget.textController,
          enableSuggestions: widget.isSecured ? false : true,
          autocorrect: false,
          obscureText: widget.isSecured ? !_passwordVisible : false,
          decoration: InputDecoration(
              prefixIcon: widget.prefixIcon != null
                  ? Icon(
                      widget.prefixIcon,
                      color: widget.prefixIconColor,
                      size: widget.prefixIconSize,
                    )
                  : null,
              border: InputBorder.none,
              suffixIcon: widget.isSecured
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      splashColor: AppColors.transparent,
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.grey,
                      ))
                  : null,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: AppColors.grey,
                fontSize: 14,
              )),
        ),
      ),
    );
  }
}
