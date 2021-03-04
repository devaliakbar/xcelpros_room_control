import 'package:flutter/material.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';

class SignUpBackIcon extends StatelessWidget {
  final Function onBackPressed;

  SignUpBackIcon({@required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.height(4),
              left: SizeConfig.widthWithoutSafeArea(13)),
          child: InkWell(
            onTap: onBackPressed,
            child: Row(
              children: [
                Hero(
                  tag: AnimationTag.backIcon,
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                    size: IconSizes.iconSizeM,
                  ),
                ),
                SizedBox(
                  width: SizeConfig.widthWithoutSafeArea(2),
                ),
                Hero(
                  tag: AnimationTag.welcomeNBack,
                  child: Material(
                    color: Colors.transparent,
                    child: NormalText(
                      AppString.back,
                      color: Colors.white,
                      boldText: true,
                      size: FontSizes.fontSizeBML,
                      truncate: true,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
