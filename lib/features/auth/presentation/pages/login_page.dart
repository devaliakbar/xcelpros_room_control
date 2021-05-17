import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/auth/presentation/pages/auth_loading_page.dart';
import 'package:room_control/features/auth/presentation/pages/sign_up_page.dart';
import 'package:room_control/core/widgets/app_background.dart';
import 'package:room_control/features/auth/presentation/providers/login/login_provider.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_mask.dart';
import 'package:room_control/features/auth/presentation/widgets/login/login_form.dart';
import 'package:room_control/features/auth/presentation/widgets/login/login_top_title.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  /// [animationController] is for Username and PasswordTextField, button and signupText
  AnimationController animationController;

  /// [bodyAnimationController] is for Smooting the growing animation of Login Form  During Navigate to Loading Page
  AnimationController bodyAnimationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    bodyAnimationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    bodyAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, loginProvider, child) {
      if (loginProvider.loginState is LoginLoadingState) {
        _showLoading();
      }

      return Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child: AppBackground(
            child: Stack(
              children: [
                CustomAnimation(
                    animationDuration: Duration(milliseconds: 500),
                    customAnimationType: CustomAnimationType.topToBottom,
                    widget: AuthMask(
                      height: SizeConfig.heightWithoutSafeArea(40),
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: SizeConfig.heightWithoutSafeArea(67),
                    child: Column(
                      children: [
                        LoginTopTitle(),
                        Expanded(
                          child: CustomAnimation(
                            animationController: bodyAnimationController,
                            customAnimationType:
                                CustomAnimationType.bottomToTop,
                            widget: Loginform(
                              animationController: animationController,
                              onSignUp: () {
                                animationController
                                    .reverse()
                                    .whenComplete(() async {
                                  await Navigator.pushNamed(
                                      context, SignUpPage.routeName);
                                  await Future.delayed(
                                      Duration(milliseconds: 150));
                                  animationController.forward();
                                });
                              },
                            ),
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
    });
  }

  Future<void> _showLoading() async {
    await Future.delayed(Duration(milliseconds: 1));
    bodyAnimationController.reverse();
    await Navigator.pushNamed(context, AuthLoadingPage.routeName);
    bodyAnimationController.forward();
  }
}
