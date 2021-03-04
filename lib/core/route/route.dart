import 'package:flutter/material.dart';
import 'package:room_control/core/animation/page_transition_animation.dart';
import 'package:room_control/features/auth/presentation/pages/auth_loading_page.dart';
import 'package:room_control/features/auth/presentation/pages/login_page.dart';
import 'package:room_control/features/auth/presentation/pages/sign_up_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return PageTransitionAnimation(
          child: LoginPage(),
          settings: settings,
        );

      case SignUpPage.routeName:
        return PageTransitionAnimation(
            child: SignUpPage(), settings: settings, showFadeEffect: false);

      case AuthLoadingPage.routeName:
        return PageTransitionAnimation(
            child: AuthLoadingPage(),
            settings: settings,
            duration: Duration(milliseconds: 300));

      default:
        assert(false, 'Need to implement ${settings.name}');
        return null;
    }
  }
}
