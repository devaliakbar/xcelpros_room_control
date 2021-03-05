import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  AppBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.heightWithoutSafeArea(100),
      width: SizeConfig.widthWithoutSafeArea(100),
      decoration: BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerLeft,
          colors: [
            AppColors.primary,
            AppColors.primaryLite,
          ],
        ),
      ),
      child: child,
    );
  }
}
