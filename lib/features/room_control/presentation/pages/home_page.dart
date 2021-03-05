import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/widgets/app_background.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: AppBackground(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
