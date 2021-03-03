import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_background.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_mask.dart';
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
        child: AuthBackground(
          child: Stack(
            children: [
              AuthMask(height: SizeConfig.heightWithoutSafeArea(42)),
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
