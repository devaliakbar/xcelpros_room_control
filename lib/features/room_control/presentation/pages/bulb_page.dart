import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/widgets/normal_text.dart';
import 'package:room_control/features/room_control/presentation/widgets/bottom_nav_bar.dart';

class BulbPage extends StatelessWidget {
  static const String routeName = '/bulb_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      bottomNavigationBar: BottomNavBar(),
      body: Center(
        child: NormalText(
          "Bulb Page",
          color: Colors.white,
          size: FontSizes.fontSizeXL,
        ),
      ),
    );
  }
}
