import 'package:flutter/material.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/custom_button.dart';
import 'package:room_control/core/widgets/normal_text.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_textfield.dart';

class SignUpform extends StatelessWidget {
  final AnimationController animationController;

  SignUpform({@required this.animationController});

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
          Column(
            children: [
              CustomAnimation(
                customAnimationType: CustomAnimationType.bottomToTop,
                widget: AuthTextField(
                    label: "Username", icon: Icons.person_outline),
              ),
              SizedBox(
                height: SizeConfig.heightWithoutSafeArea(4),
              ),
              CustomAnimation(
                customAnimationType: CustomAnimationType.bottomToTop,
                widget: AuthTextField(
                  label: "Password",
                  icon: Icons.lock_open_outlined,
                  obsecure: true,
                ),
              ),
              SizedBox(
                height: SizeConfig.heightWithoutSafeArea(4),
              ),
              CustomAnimation(
                customAnimationType: CustomAnimationType.bottomToTop,
                widget: AuthTextField(
                  label: "Email",
                  icon: Icons.email_outlined,
                  inputType: TextInputType.emailAddress,
                ),
              ),
            ],
          ),
          Column(
            children: [
              CustomAnimation(
                customAnimationType: CustomAnimationType.bottomToTop,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_box_outline_blank_outlined,
                      size: IconSizes.iconSizeM,
                      color: AppColors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    NormalText(
                      "I have accepted the",
                      color: AppColors.grey,
                      size: FontSizes.fontSizeBXSS,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    InkWell(
                      onTap: () {},
                      child: NormalText(
                        "Terms & Condition",
                        boldText: true,
                        color: AppColors.secondary,
                        size: FontSizes.fontSizeBXSS,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.heightWithoutSafeArea(4),
              ),
              CustomButton(
                animationController: animationController,
                onClick: () {},
                title: "Sign Up".toUpperCase(),
                width: double.infinity,
              ),
            ],
          )
        ],
      ),
    );
  }
}
