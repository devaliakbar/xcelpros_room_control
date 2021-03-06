import 'package:flutter/material.dart';
import 'package:room_control/core/animation/page_transition_animation.dart';
import 'package:room_control/features/auth/presentation/pages/auth_loading_page.dart';
import 'package:room_control/features/auth/presentation/pages/login_page.dart';
import 'package:room_control/features/auth/presentation/pages/sign_up_page.dart';
import 'package:room_control/features/room_control/presentation/pages/home_page.dart';
import 'package:room_control/features/room_control/presentation/pages/room_page.dart';
import 'package:room_control/features/welcome/presentation/pages/splash_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return PageTransitionAnimation(
          child: SplashScreen(),
          settings: settings,
        );

      case LoginPage.routeName:
        return PageTransitionAnimation(
          child: LoginPage(),
          settings: settings,
        );

      case SignUpPage.routeName:
        return PageTransitionAnimation(
            child: SignUpPage(),
            settings: settings,
            showFadeEffect: false,
            duration: Duration(milliseconds: 200),
            reverseDuration: Duration(milliseconds: 200));

      case AuthLoadingPage.routeName:
        return PageTransitionAnimation(
          child: AuthLoadingPage(),
          settings: settings,
        );

      case HomePage.routeName:
        return PageTransitionAnimation(
          child: HomePage(),
          settings: settings,
        );

      case RoomPage.routeName:
        return PageTransitionAnimation(
          child: RoomPage(
            room: settings.arguments,
          ),
          duration: Duration(milliseconds: 700),
          settings: settings,
        );

      default:
        assert(false, 'Need to implement ${settings.name}');
        return null;
    }
  }
}
