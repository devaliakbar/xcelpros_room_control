import 'package:flutter/material.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/custom_button.dart';
import 'package:room_control/core/widgets/normal_text.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_textfield.dart';

class Loginform extends StatelessWidget {
  final AnimationController animationController;
  final Function onSignUp;

  Loginform({@required this.animationController, @required this.onSignUp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthWithoutSafeArea(13),
      ),
      width: SizeConfig.widthWithoutSafeArea(100),
      margin: EdgeInsets.only(
        top: SizeConfig.heightWithoutSafeArea(4.5),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.widthWithoutSafeArea(10)),
          topRight: Radius.circular(SizeConfig.widthWithoutSafeArea(10)),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomAnimation(
            customAnimationType: CustomAnimationType.topToBottom,
            animationController: animationController,
            widget:
                AuthTextField(label: "Username", icon: Icons.person_outline),
          ),
          CustomAnimation(
            customAnimationType: CustomAnimationType.topToBottom,
            animationController: animationController,
            widget: AuthTextField(
              label: "Password",
              icon: Icons.lock_open_outlined,
              obsecure: true,
            ),
          ),
          Hero(
            tag: AnimationTag.authButton,
            child: CustomButton(
              animationController: animationController,
              onClick: () {},
              title: "Sign In".toUpperCase(),
              width: double.infinity,
            ),
          ),
          CustomAnimation(
            animationController: animationController,
            customAnimationType: CustomAnimationType.bottomToTop,
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NormalText(
                  "Don't have an account?",
                  color: AppColors.grey,
                  size: FontSizes.fontSizeBSM,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: onSignUp,
                  child: NormalText(
                    "Sign UP".toUpperCase(),
                    boldText: true,
                    color: AppColors.secondary,
                    size: FontSizes.fontSizeBSM,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
