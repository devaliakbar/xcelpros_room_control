import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';

class SignUpTopTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthWithoutSafeArea(13),
      ),
      child: Hero(
        tag: "title",
        child: Material(
          color: Colors.transparent,
          child: NormalText(
            "Create New Account ",
            color: Colors.white,
            size: FontSizes.fontSizeXL,
            truncate: true,
          ),
        ),
      ),
    );
  }
}
