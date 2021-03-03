import 'package:flutter/material.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';

class LoginTopTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthWithoutSafeArea(10),
      ),
      child: CustomAnimation(
        customAnimationType: CustomAnimationType.topToBottom,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: "back_icon",
              child: Icon(
                Icons.horizontal_rule_sharp,
                color: Colors.white,
                size: SizeConfig.widthWithoutSafeArea(15),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: SizeConfig.widthWithoutSafeArea(3)),
              child: Hero(
                tag: "welcome",
                child: Material(
                  color: Colors.transparent,
                  child: NormalText(
                    "Welcome",
                    color: Colors.white,
                    size: FontSizes.fontSizeXL,
                    boldText: true,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.heightWithoutSafeArea(2),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: SizeConfig.widthWithoutSafeArea(3)),
              child: Hero(
                tag: "title",
                child: Material(
                  color: Colors.transparent,
                  child: NormalText(
                    "to Room Control",
                    color: Colors.white,
                    size: FontSizes.fontSizeXL,
                    truncate: true,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
