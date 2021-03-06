import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/res/icon/room_control_icons_icons.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';

class AuthLoadingAnimation extends StatefulWidget {
  @override
  _AuthLoadingAnimationState createState() => _AuthLoadingAnimationState();
}

class _AuthLoadingAnimationState extends State<AuthLoadingAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _loadingcontroller;
  Animation<double> _sizeAnimation, _rotationAnimation;
  Animation _curve;

  bool _isBigToSmall = true;

  @override
  void initState() {
    super.initState();

    _loadingcontroller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _curve =
        CurvedAnimation(parent: _loadingcontroller, curve: Curves.elasticOut);

    /// INITIALLY ROATATE HALF AND SHRINK THE LOADING ICON. ONCE THAT COMPLETE CHANGE ANIMTION TO ROTATE ANOTHER HALF AND
    /// EXPAND THE LOADING ICON. REPEATE THIS PROCESS. [_isBigToSmall] IS USED TO TRACK THE CURRENT STATE OF LOADER ICON.
    /// [_setUpAnimation] FUNCTION HELPS TO CHANGE THE BEHAVIOUR OF THE ANIMATION USING [_isBigToSmall]

    _setUpAnimation();

    _loadingcontroller.forward();

    _loadingcontroller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        _loadingcontroller.reset();
        _isBigToSmall = !_isBigToSmall;
        _setUpAnimation();
        _loadingcontroller.forward();
      }
    });
  }

  @override
  void dispose() {
    _loadingcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child: Icon(
                    RoomControlIcons.Loading,
                    color: AppColors.loading,
                    size: _sizeAnimation.value,
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
    );
  }

  void _setUpAnimation() {
    if (_isBigToSmall) {
      _rotationAnimation = Tween<double>(begin: 0, end: 0.25).animate(_curve);

      _sizeAnimation = Tween<double>(
              begin: IconSizes.loadingIconSize, end: IconSizes.iconSizeM)
          .animate(_curve);
    } else {
      _rotationAnimation = Tween<double>(begin: 0.25, end: 0.5).animate(_curve);

      _sizeAnimation = Tween<double>(
              begin: IconSizes.iconSizeM, end: IconSizes.loadingIconSize)
          .animate(_curve);
    }
  }
}
