import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:room_control/core/route/route.dart';
import 'package:room_control/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:room_control/features/auth/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:room_control/features/welcome/presentation/pages/splash_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => di.sl<LoginBloc>()),
        BlocProvider<SignUpBloc>(create: (context) => di.sl<SignUpBloc>()),
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
