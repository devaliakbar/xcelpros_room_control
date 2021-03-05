import 'package:flutter/material.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';

class RoomBody extends StatelessWidget {
  final bool showBody;
  RoomBody({@required this.showBody});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AnimationTag.homeBody,
      child: Container(
        padding: EdgeInsets.all(SizeConfig.width(5)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeConfig.width(8)),
            topRight: Radius.circular(SizeConfig.width(8)),
          ),
        ),
        child: showBody
            ? Center(
                child: FlutterLogo(),
              )
            : Container(),
      ),
    );
  }
}
