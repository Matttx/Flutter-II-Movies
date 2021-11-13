import 'package:flutter/material.dart';
import 'package:movies/src/widgets/title.dart';
import 'app_name_logo.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader(
      {Key? key,
      this.topBox,
      required this.title,
      this.topTitleBox,
      required this.image,
      required this.imageWidth,
      this.bottomBox})
      : super(key: key);

  final double? topBox;
  final String title;
  final double? topTitleBox;
  final String image;
  final double imageWidth;
  final double? bottomBox;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: topBox ?? 50,
        ),
        const AppNameLogo(),
        const SizedBox(
          height: 30,
        ),
        AppTitle(
          title: title,
          leftPadding: 30,
        ),
        SizedBox(
          height: topTitleBox ?? 10,
        ),
        Image.asset(
          image,
          width: imageWidth,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: bottomBox ?? 30,
        ),
      ],
    );
  }
}
