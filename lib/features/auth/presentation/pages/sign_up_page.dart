import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_background.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_mask.dart';
import 'package:room_control/features/auth/presentation/widgets/sign_up_back_icon.dart';
import 'package:room_control/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:room_control/features/auth/presentation/widgets/sign_up_top_title.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signup_page';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  /// [_animationController] is for button
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
                height: SizeConfig.heightWithoutSafeArea(20),
              ),
              SignUpBackIcon(
                onBackPressed: () {
                  animationController
                      .reverse()
                      .whenComplete(() => Navigator.pop(context));
                },
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: SizeConfig.heightWithoutSafeArea(80),
                  child: Column(
                    children: [
                      SignUpTopTitle(),
                      Expanded(
                        child: SignUpform(
                          animationController: animationController,
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
