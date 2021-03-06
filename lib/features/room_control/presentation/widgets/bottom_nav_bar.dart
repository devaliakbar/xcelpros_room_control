import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/room_control/presentation/pages/bulb_page.dart';
import 'package:room_control/features/room_control/presentation/pages/home_page.dart';
import 'package:room_control/features/room_control/presentation/pages/settings_page.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.heightWithoutSafeArea(2.5)),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (ModalRoute.of(context).settings.name !=
                    BulbPage.routeName) {
                  Navigator.pushNamed(context, BulbPage.routeName);
                }
              },
              child: Image.asset(
                AppImages.iconBulb,
                fit: BoxFit.fitHeight,
                height: SizeConfig.heightWithoutSafeArea(3),
              ),
            ),
            SizedBox(
              width: SizeConfig.width(15),
            ),
            InkWell(
              onTap: () {
                if (ModalRoute.of(context).settings.name !=
                    HomePage.routeName) {
                  Navigator.pushNamed(context, HomePage.routeName);
                }
              },
              child: Image.asset(
                AppImages.iconHome,
                fit: BoxFit.fitHeight,
                height: SizeConfig.heightWithoutSafeArea(3),
              ),
            ),
            SizedBox(
              width: SizeConfig.width(15),
            ),
            InkWell(
              onTap: () {
                if (ModalRoute.of(context).settings.name !=
                    SettingsPage.routeName) {
                  Navigator.pushNamed(context, SettingsPage.routeName);
                }
              },
              child: Image.asset(
                AppImages.iconSettings,
                fit: BoxFit.fitHeight,
                height: SizeConfig.heightWithoutSafeArea(3),
              ),
            )
          ],
        ),
      ),
    );
  }
}
