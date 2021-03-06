import 'package:flutter/material.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';

class RoomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AnimationTag.homeBody,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: SizeConfig.width(100),
          padding: EdgeInsets.all(SizeConfig.width(5)),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeConfig.width(8)),
              topRight: Radius.circular(SizeConfig.width(8)),
            ),
          ),
          child: Column(
            children: [
              FlutterLogo(
                size: 150,
              ),
              FlutterLogo(
                size: 150,
              ),
              FlutterLogo(
                size: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
