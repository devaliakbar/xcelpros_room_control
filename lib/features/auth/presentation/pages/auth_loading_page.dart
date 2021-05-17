import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/show_toast.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/app_background.dart';
import 'package:room_control/features/auth/presentation/providers/login/login_provider.dart';
import 'package:room_control/features/auth/presentation/providers/sign_up/sign_up_provider.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_loading/auth_loading_animation.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_mask.dart';
import 'package:room_control/features/room_control/presentation/pages/home_page.dart';

class AuthLoadingPage extends StatefulWidget {
  static const String routeName = '/auth_loading_page';

  @override
  _AuthLoadingPageState createState() => _AuthLoadingPageState();
}

class _AuthLoadingPageState extends State<AuthLoadingPage>
    with SingleTickerProviderStateMixin {
  AnimationController _exitAnimation;

  @override
  void initState() {
    super.initState();

    _exitAnimation = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _exitAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<SignUpProvider, LoginProvider>(
        builder: (context, signUpProvider, loginProvider, child) {
      //CHECKING FOR SIGNUP
      SignUpState signUpState = signUpProvider.signUpState;
      if (signUpState is SignUpErrorState) {
        authFailed(signUpState.message).then((value) => signUpProvider.reset());
      } else if (signUpState is SignUpSuccessState) {
        _exitAnimation.reverse().whenComplete(() => Navigator.of(context)
            .pushNamedAndRemoveUntil(
                HomePage.routeName, (Route<dynamic> route) => false)
            .then(
              (value) => signUpProvider.reset(),
            ));
      }

      //CHECKING FOR LOGIN
      LoginState loginState = loginProvider.loginState;
      if (loginState is LoginErrorState) {
        authFailed(loginState.message).then((value) => loginProvider.reset());
      } else if (loginState is LoginSuccessState) {
        _exitAnimation.reverse().whenComplete(() => Navigator.of(context)
            .pushNamedAndRemoveUntil(
                HomePage.routeName, (Route<dynamic> route) => false)
            .then(
              (value) => loginProvider.reset(),
            ));
      }

      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: AppColors.primary,
          body: AppBackground(
            child: Stack(
              children: [
                CustomAnimation(
                  customAnimationType: CustomAnimationType.topToBottom,
                  animationController: _exitAnimation,
                  showWidgetWithoutAnimation: true,
                  widget: AuthMask(
                    height: SizeConfig.heightWithoutSafeArea(56),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AuthLoadingAnimation(),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<void> authFailed(String message) async {
    ShowToast(message);
    await Future.delayed(Duration(seconds: 2));
    Navigator.pop(context);
  }
}
