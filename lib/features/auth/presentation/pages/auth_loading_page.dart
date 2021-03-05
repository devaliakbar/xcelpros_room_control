import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/show_toast.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:room_control/features/auth/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:room_control/core/widgets/app_background.dart';
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
    return MultiBlocListener(
      listeners: [
        BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) async {
            print("Auth Loading Screen State Changed (For SignUp)");

            if (state is SignUpErrorState) {
              ShowToast(state.message);

              await Future.delayed(Duration(seconds: 2));

              Navigator.pop(context);
            } else if (state is SignUpSuccessState) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  HomePage.routeName, (Route<dynamic> route) => false);
            }
          },
        ),
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) async {
            print("Auth Loading Screen State Changed (For Login)");

            if (state is LoginErrorState) {
              ShowToast(state.message);

              await Future.delayed(Duration(seconds: 2));

              Navigator.pop(context);
            } else if (state is LoginSuccessState) {
              _exitAnimation.reverse().whenComplete(() => Navigator.of(context)
                  .pushNamedAndRemoveUntil(
                      HomePage.routeName, (Route<dynamic> route) => false));
            }
          },
        ),
      ],
      child: WillPopScope(
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
      ),
    );
  }
}
