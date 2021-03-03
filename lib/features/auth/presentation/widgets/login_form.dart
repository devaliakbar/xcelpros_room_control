import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/custom_button.dart';
import 'package:room_control/core/widgets/normal_text.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_textfield.dart';

class Loginform extends StatelessWidget {
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
          AuthTextField(label: "Username", icon: Icons.person_outline),
          AuthTextField(
            label: "Password",
            icon: Icons.lock_open_outlined,
            obsecure: true,
          ),
          CustomButton(
            onClick: () {},
            title: "Sign In".toUpperCase(),
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NormalText(
                "Don't have an account?",
                color: AppColors.grey,
                size: FontSizes.fontSizeL,
              ),
              SizedBox(
                width: 10,
              ),
              NormalText(
                "Sign UP".toUpperCase(),
                boldText: true,
                color: AppColors.secondary,
                size: FontSizes.fontSizeL,
              )
            ],
          )
        ],
      ),
    );
  }
}
