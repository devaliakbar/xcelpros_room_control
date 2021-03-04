import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/auth/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:room_control/features/auth/presentation/pages/auth_loading_page.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_background.dart';
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

  /// [_expanded] is for smooothing form conatiner
  bool _expanded = false;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        print("Login Screen State Changed");

        if (state is SignUpLoadingState) {
          animationController.reverse().whenComplete(() async {
            await Navigator.pushNamed(context, AuthLoadingPage.routeName);
            await Future.delayed(Duration(milliseconds: 150));
            animationController.forward();
          });
        }
      },
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: AppColors.primary,
          body: SingleChildScrollView(
            child: AuthBackground(
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
        ),
      ),
    );
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
