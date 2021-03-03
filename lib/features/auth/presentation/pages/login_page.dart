import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/auth/presentation/widgets/login_form.dart';
import 'package:room_control/features/auth/presentation/widgets/login_top_title.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login_page';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.heightWithoutSafeArea(100),
          width: SizeConfig.widthWithoutSafeArea(100),
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerLeft,
              colors: [
                AppColors.primary,
                AppColors.primaryLite,
              ],
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Hero(
                  tag: "mask",
                  child: Image.asset(
                    AppImages.authMask,
                    height: SizeConfig.heightWithoutSafeArea(42),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: SizeConfig.heightWithoutSafeArea(63),
                  child: Column(
                    children: [
                      LoginTopTitle(),
                      Expanded(
                        child: Loginform(),
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
