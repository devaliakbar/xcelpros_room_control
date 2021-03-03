import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';

class AuthMask extends StatelessWidget {
  final double height;

  AuthMask({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Hero(
        tag: "mask",
        child: Image.asset(
          AppImages.authMask,
          height: height,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
