import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_background.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_mask.dart';

class AuthLoadingPage extends StatefulWidget {
  static const String routeName = '/auth_loading_page';

  @override
  _AuthLoadingPageState createState() => _AuthLoadingPageState();
}

class _AuthLoadingPageState extends State<AuthLoadingPage>
    with SingleTickerProviderStateMixin {
  AnimationController _loadingcontroller;

  Animation<double> _sizeAnimation, _rotationAnimation;

  Animation _curve;

  @override
  void initState() {
    super.initState();

    _loadingcontroller = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );
    _curve = CurvedAnimation(parent: _loadingcontroller, curve: Curves.easeOut);

    _rotationAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 0.5), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0, end: 0.5), weight: 50)
    ]).animate(_curve);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(
              begin: SizeConfig.widthWithoutSafeArea(15),
              end: SizeConfig.widthWithoutSafeArea(7)),
          weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(
              begin: SizeConfig.widthWithoutSafeArea(7),
              end: SizeConfig.widthWithoutSafeArea(15)),
          weight: 50),
    ]).animate(_curve);

    _loadingcontroller.repeat();
  }

  @override
  void dispose() {
    _loadingcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: AuthBackground(
        child: Stack(
          children: [
            AuthMask(
              height: SizeConfig.heightWithoutSafeArea(56),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: SizeConfig.widthWithoutSafeArea(100),
                height: SizeConfig.heightWithoutSafeArea(60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: SizeConfig.heightWithoutSafeArea(18),
                      child: AnimatedBuilder(
                        animation: _loadingcontroller,
                        builder: (_, child) {
                          return Transform.rotate(
                            angle: _rotationAnimation.value * 2 * math.pi,
                            child: Container(
                              width: _sizeAnimation.value,
                              child: Image.asset(
                                AppImages.loadingIcon,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Hero(
                      tag: AnimationTag.authTitle,
                      child: Material(
                        color: Colors.transparent,
                        child: NormalText(
                          AppString.letGetYouStarted,
                          color: Colors.white,
                          size: FontSizes.fontSizeXL,
                          truncate: true,
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
    );
  }
}
