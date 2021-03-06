import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';
import 'package:room_control/core/route/route.dart';
import 'package:room_control/features/room_control/presentation/providers/room_provider.dart';
import 'package:room_control/features/welcome/presentation/pages/splash_screen.dart';
import 'package:room_control/features/auth/presentation/providers/login/login_provider.dart';
import 'package:room_control/features/auth/presentation/providers/sign_up/sign_up_provider.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<LoginProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<SignUpProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<RoomProvider>()),
      ],
      child: EasyLocalization(
        child: MyApp(),
        supportedLocales: [Locale('en', 'US')],
        fallbackLocale: Locale('en', 'US'),
        path: 'assets/lang',
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RoomControl',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        fontFamily: 'SFPro',
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: SplashScreen(),
    );
  }
}
