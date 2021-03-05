import 'package:flutter/material.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';

class HomeBackgroundElements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -SizeConfig.width(20),
          top: -SizeConfig.height(12.6),
          child: Hero(
            tag: AnimationTag.backgroundElement1,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryLite.withOpacity(0.3),
                  shape: BoxShape.circle),
              width: SizeConfig.height(25.3),
              height: SizeConfig.height(25.3),
            ),
          ),
        ),
        Positioned(
          left: -SizeConfig.width(1.8),
          top: SizeConfig.height(17),
          child: Hero(
            tag: AnimationTag.backgroundElement2,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryLite.withOpacity(0.9),
                  shape: BoxShape.circle),
              width: SizeConfig.height(25.3),
              height: SizeConfig.height(25.3),
            ),
          ),
        ),
        Positioned(
          right: -SizeConfig.width(23),
          top: SizeConfig.height(7.5),
          child: Hero(
            tag: AnimationTag.backgroundElement3,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryLite.withOpacity(0.3),
                  shape: BoxShape.circle),
              width: SizeConfig.height(25.3),
              height: SizeConfig.height(25.3),
            ),
          ),
        )
      ],
    );
  }
}
