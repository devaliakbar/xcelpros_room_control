import 'package:flutter/material.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';

class RoomBackgroundElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AnimationTag.backgroundElement,
      child: Stack(
        children: [
          Positioned(
            left: -SizeConfig.width(25),
            top: SizeConfig.height(6),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryLite.withOpacity(0.3),
                  shape: BoxShape.circle),
              width: SizeConfig.height(25.3),
              height: SizeConfig.height(25.3),
            ),
          ),
          Positioned(
            left: SizeConfig.width(35),
            top: SizeConfig.height(22),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryLite.withOpacity(0.9),
                  shape: BoxShape.circle),
              width: SizeConfig.height(25.3),
              height: SizeConfig.height(25.3),
            ),
          ),
          Positioned(
            right: -SizeConfig.width(20),
            top: -SizeConfig.height(9),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primaryLite.withOpacity(0.3),
                  shape: BoxShape.circle),
              width: SizeConfig.height(25.3),
              height: SizeConfig.height(25.3),
            ),
          )
        ],
      ),
    );
  }
}
