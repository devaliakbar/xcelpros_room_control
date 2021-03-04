import 'package:flutter/material.dart';

class PageTransitionAnimation extends PageRouteBuilder {
  final Widget child;

  final Duration duration;

  final Duration reverseDuration;

  PageTransitionAnimation({
    Key key,
    @required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.reverseDuration = const Duration(milliseconds: 200),
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
            return child;
            // return FadeTransition(opacity: animation, child: child);
          },
        );
}
