import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/auth/presentation/pages/sign_up_page.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_background.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_mask.dart';
import 'package:room_control/features/auth/presentation/widgets/login_form.dart';
import 'package:room_control/features/auth/presentation/widgets/login_top_title.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  /// [_animationController] is for Username and PasswordTextField, button and signupText
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
  }

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
                height: SizeConfig.heightWithoutSafeArea(42),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: SizeConfig.heightWithoutSafeArea(63),
                  child: Column(
                    children: [
                      LoginTopTitle(),
                      Expanded(
                        child: Loginform(
                          animationController: animationController,
                          onSignUp: () async {
                            animationController.reverse();
                            await Navigator.pushNamed(
                                context, SignUpPage.routeName);
                            animationController.forward();
                          },
                        ),
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
