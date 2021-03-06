import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/room_control/presentation/widgets/room/room_body/room_body_colors.dart';
import 'package:room_control/features/room_control/presentation/widgets/room/room_body/room_body_scenes.dart';

import 'package:room_control/features/room_control/presentation/widgets/room/room_body/room_body_intensity.dart';

class RoomBody extends StatelessWidget {
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: AnimationTag.homeBody,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: SizeConfig.width(100),
              margin: EdgeInsets.only(top: SizeConfig.height(2.5)),
              padding: EdgeInsets.all(SizeConfig.width(5)),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeConfig.width(8)),
                  topRight: Radius.circular(SizeConfig.width(8)),
                ),
              ),
              child: Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      RoomBodyIntensity(),
                      SizedBox(
                        height: SizeConfig.height(4),
                      ),
                      RoomBodyColors(),
                      SizedBox(
                        height: SizeConfig.height(4),
                      ),
                      RoomBodyScenes(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: SizeConfig.width(5),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeConfig.height(4)),
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.height(0.4)),
              child: Icon(
                Icons.power_settings_new_rounded,
                color: AppColors.power,
                size: IconSizes.iconSizeL,
              ),
            ),
          ),
        )
      ],
    );
  }
}
