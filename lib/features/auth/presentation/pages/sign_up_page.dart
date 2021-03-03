import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_background.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_mask.dart';
import 'package:room_control/features/auth/presentation/widgets/sign_up_back_icon.dart';
import 'package:room_control/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:room_control/features/auth/presentation/widgets/sign_up_top_title.dart';

class SignUpPage extends StatelessWidget {
  static const String routeName = '/signup_page';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: AuthBackground(
          child: Stack(
            children: [
              AuthMask(
                height: SizeConfig.heightWithoutSafeArea(20),
              ),
              SignUpBackIcon(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: SizeConfig.heightWithoutSafeArea(80),
                  child: Column(
                    children: [
                      SignUpTopTitle(),
                      Expanded(
                        child: SignUpform(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
