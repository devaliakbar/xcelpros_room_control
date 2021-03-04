import 'package:flutter/material.dart';

class PageTransitionAnimation extends PageRouteBuilder {
  final Widget child;

  final Duration duration;

  final Duration reverseDuration;

  final bool showFadeEffect;

  PageTransitionAnimation({
    Key key,
    @required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.reverseDuration = const Duration(milliseconds: 300),
    this.showFadeEffect = true,
    RouteSettings settings,
  }) : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return child;
          },
          transitionDuration: duration,
          reverseTransitionDuration: reverseDuration,
          settings: settings,
          maintainState: true,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            if (showFadeEffect) {
              return FadeTransition(opacity: animation, child: child);
            } else {
              return child;
            }
          },
        );
}
