import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        SizeConfig.width(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NormalText(
            AppString.controlPanel,
            color: Colors.white,
            boldText: true,
            size: FontSizes.fontSizeXXL,
          ),
          Image.asset(
            AppImages.user,
            height: SizeConfig.height(10),
            fit: BoxFit.fitHeight,
          )
        ],
      ),
    );
  }
}
