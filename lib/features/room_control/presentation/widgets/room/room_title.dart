import 'package:flutter/material.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';

class RoomTitle extends StatelessWidget {
  final AnimationController animationController;

  RoomTitle({@required this.animationController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: SizeConfig.width(5), top: SizeConfig.height(9)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: IconSizes.iconSizeS,
                    ),
                    SizedBox(
                      width: SizeConfig.width(1),
                    ),
                    NormalText(
                      AppString.bed,
                      color: Colors.white,
                      boldText: true,
                      size: FontSizes.fontSizeXXL,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.height(0.5),
                ),
                NormalText(
                  AppString.room,
                  color: Colors.white,
                  boldText: true,
                  size: FontSizes.fontSizeXXL,
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.height(1.5),
          ),
          CustomAnimation(
            animationController: animationController,
            customAnimationType: CustomAnimationType.topToBottom,
            playAnimation: false,
            widget: NormalText(
              "4 ${AppString.lights}",
              color: AppColors.yellowBulb,
              boldText: true,
              size: FontSizes.fontSizeL,
            ),
          ),
        ],
      ),
    );
  }
}
