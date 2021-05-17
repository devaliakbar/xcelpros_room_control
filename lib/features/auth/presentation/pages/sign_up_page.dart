import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/auth/presentation/pages/auth_loading_page.dart';
import 'package:room_control/core/widgets/app_background.dart';
import 'package:room_control/features/auth/presentation/providers/sign_up/sign_up_provider.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_mask.dart';
import 'package:room_control/features/auth/presentation/widgets/sign_up/sign_up_back_icon.dart';
import 'package:room_control/features/auth/presentation/widgets/sign_up/sign_up_form.dart';
import 'package:room_control/features/auth/presentation/widgets/sign_up/sign_up_top_title.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signup_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  /// [_animationController] is for button, 3 textfields, terms and condiition and button
  AnimationController animationController;

  /// [bodyAnimationController] is for Smooting the growing animation of SignUp Form  During Navigate to Loading Page
  AnimationController bodyAnimationController;

  /// [_expanded] is for smooothing form conatiner. Due to the height difference of Login Form and Sign Up Form , Form Container
  /// Growing effect is not smooth during navigate between Login and Sign Up Pages. So here grow and shrink container manually.
  bool _expanded = false;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    bodyAnimationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        _expanded = true;
      });
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    bodyAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(builder: (context, loginProvider, child) {
      if (loginProvider.signUpState is SignUpLoadingState) {
        _showLoading();
      }

      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: AppColors.primary,
          body: SingleChildScrollView(
            child: AppBackground(
              child: Stack(
                children: [
                  AuthMask(
                    height: SizeConfig.heightWithoutSafeArea(20),
                  ),
                  SignUpBackIcon(
                    onBackPressed: () async {
                      animationController.reverse().whenComplete(() {
                        setState(() {
                          _expanded = false;
                        });

                        Navigator.pop(context);
                      });
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: SizeConfig.heightWithoutSafeArea(
                          _expanded ? 80 : 54.5),
                      child: Column(
                        children: [
                          SignUpTopTitle(),
                          Expanded(
                            child: CustomAnimation(
                              animationController: bodyAnimationController,
                              showWidgetWithoutAnimation: true,
                              customAnimationType:
                                  CustomAnimationType.bottomToTop,
                              widget: SignUpform(
                                animationController: animationController,
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

  Future<bool> _onWillPop() async {
    animationController.reverse().whenComplete(() {
      setState(() {
        _expanded = false;
      });

      Navigator.pop(context);
    });
    return false;
  }
}
