import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: SizeConfig.heightWithoutSafeArea(2)),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.iconBulb,
              fit: BoxFit.fitHeight,
              height: SizeConfig.heightWithoutSafeArea(3),
            ),
            SizedBox(
              width: SizeConfig.width(15),
            ),
            Image.asset(
              AppImages.iconHome,
              fit: BoxFit.fitHeight,
              height: SizeConfig.heightWithoutSafeArea(3),
            ),
            SizedBox(
              width: SizeConfig.width(15),
            ),
            Image.asset(
              AppImages.iconSettings,
              fit: BoxFit.fitHeight,
              height: SizeConfig.heightWithoutSafeArea(3),
            ),
          ],
        ),
      ),
    );
  }
}
