import 'package:flutter/material.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/res/icon/room_control_icons_icons.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';

class RoomBodyScenes extends StatelessWidget {
  final AnimationController animationController;
  RoomBodyScenes({@required this.animationController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          AppString.scenes,
          size: FontSizes.fontSizeL,
          boldText: true,
          color: AppColors.blue,
        ),
        SizedBox(
          height: SizeConfig.height(3),
        ),
        Row(
          children: [
            Expanded(
              child: _buildScene(
                  label: "Birthday",
                  gradient1: AppColors.bulb1,
                  gardient2: AppColors.bulb6),
            ),
            SizedBox(
              width: SizeConfig.width(5),
            ),
            Expanded(
              child: CustomAnimation(
                  animationController: animationController,
                  customAnimationType: CustomAnimationType.leftToRight,
                  opacityEffect: false,
                  playAnimation: false,
                  widget: _buildScene(
                      label: "Party",
                      gradient1: AppColors.bulb4,
                      gardient2: AppColors.bulb5)),
            )
          ],
        ),
        SizedBox(
          height: SizeConfig.width(5),
        ),
        Row(
          children: [
            Expanded(
              child: _buildScene(
                  label: "Relax",
                  gradient1: AppColors.bulb3,
                  gardient2: AppColors.bulb3Light),
            ),
            SizedBox(
              width: SizeConfig.width(5),
            ),
            Expanded(
              child: CustomAnimation(
                animationController: animationController,
                customAnimationType: CustomAnimationType.leftToRight,
                opacityEffect: false,
                playAnimation: false,
                widget: _buildScene(
                    label: "Fun",
                    gradient1: AppColors.bulb2,
                    gardient2: AppColors.bulb2Light),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildScene(
      {@required Color gradient1,
      @required Color gardient2,
      @required String label}) {
    return Container(
      height: SizeConfig.height(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeConfig.width(4),
        ),
        gradient: new LinearGradient(
          begin: Alignment.center,
          end: Alignment.centerRight,
          colors: [
            gradient1,
            gardient2,
          ],
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: SizeConfig.width(5),
          ),
          Icon(
            RoomControlIcons.Bulb,
            color: Colors.white,
          ),
          SizedBox(
            width: SizeConfig.width(5),
          ),
          NormalText(
            label,
            color: Colors.white,
            size: FontSizes.fontSizeBSM,
            boldText: true,
          )
        ],
      ),
    );
  }
}
