import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';

class SignUpBackIcon extends StatelessWidget {
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
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Hero(
                    tag: "back_icon",
                    child: Image.asset(
                      AppImages.backIcon,
                      height: IconSizes.iconSizeXS,
                    )),
                SizedBox(
                  width: SizeConfig.widthWithoutSafeArea(2),
                ),
                NormalText(
                  "Back",
                  color: Colors.white,
                  boldText: true,
                  size: FontSizes.fontSizeBML,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
