import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:room_control/features/auth/presentation/pages/auth_loading_page.dart';
import 'package:room_control/features/auth/presentation/pages/sign_up_page.dart';
import 'package:room_control/core/widgets/app_background.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_mask.dart';
import 'package:room_control/features/auth/presentation/widgets/login/login_form.dart';
import 'package:room_control/features/auth/presentation/widgets/login/login_top_title.dart';

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
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        print("Login Screen State Changed");

        if (state is LoginLoadingState) {
          animationController.reverse().whenComplete(() async {
            await Navigator.pushNamed(context, AuthLoadingPage.routeName);
            await Future.delayed(Duration(milliseconds: 150));
            animationController.forward();
          });
        }
      },
      child: Scaffold(
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
                          child: Loginform(
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
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
