import 'dart:async';

import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/auth/presentation/pages/login_page.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () async {
      Navigator.of(context).pushNamedAndRemoveUntil(
          LoginPage.routeName, (Route<dynamic> route) => false);
    });

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.width(6)),
        child: Center(
          child: Image.asset(AppImages.splashScreen),
        ),
      ),
    );
  }
}
