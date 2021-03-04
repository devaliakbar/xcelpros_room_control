import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/custom_button.dart';
import 'package:room_control/core/widgets/normal_text.dart';
import 'package:room_control/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_textfield.dart';

class Loginform extends StatefulWidget {
  final AnimationController animationController;
  final Function onSignUp;

  Loginform({
    @required this.animationController,
    @required this.onSignUp,
  });

  @override
  _LoginformState createState() => _LoginformState();
}

class _LoginformState extends State<Loginform> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userNamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  bool _isButtonDisable = true;

  @override
  void dispose() {
    _userNamecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthWithoutSafeArea(13),
      ),
      width: SizeConfig.widthWithoutSafeArea(100),
      margin: EdgeInsets.only(
        top: SizeConfig.heightWithoutSafeArea(4.5),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.widthWithoutSafeArea(10)),
          topRight: Radius.circular(SizeConfig.widthWithoutSafeArea(10)),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomAnimation(
              customAnimationType: CustomAnimationType.topToBottom,
              animationController: widget.animationController,
              widget: AuthTextField(
                label: AppString.username,
                icon: Icons.person_outline,
                validator: onValidateUsername,
                controller: _userNamecontroller,
                onChanged: onTextChange,
              ),
            ),
            CustomAnimation(
              customAnimationType: CustomAnimationType.topToBottom,
              animationController: widget.animationController,
              widget: AuthTextField(
                label: AppString.password,
                validator: onValidatePassword,
                icon: Icons.lock_open_outlined,
                controller: _passwordcontroller,
                obsecure: true,
                onChanged: onTextChange,
              ),
            ),
            Hero(
              tag: AnimationTag.authButton,
              child: CustomButton(
                animationController: widget.animationController,
                onClick: _isButtonDisable ? null : onSignIn,
                title: AppString.signIn.toUpperCase(),
                width: double.infinity,
              ),
            ),
            CustomAnimation(
              animationController: widget.animationController,
              customAnimationType: CustomAnimationType.bottomToTop,
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NormalText(
                    AppString.dontHaveAccount,
                    color: AppColors.grey,
                    size: FontSizes.fontSizeBSM,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: widget.onSignUp,
                    child: NormalText(
                      AppString.signUp.toUpperCase(),
                      boldText: true,
                      color: AppColors.secondary,
                      size: FontSizes.fontSizeBSM,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onTextChange(String value) {
    String username = _userNamecontroller.text.trim();
    String password = _passwordcontroller.text.trim();

    if (username != "" && password != "") {
      if (_isButtonDisable) {
        setState(() {
          _isButtonDisable = false;
        });
      }
    } else {
      if (!_isButtonDisable) {
        setState(() {
          _isButtonDisable = true;
        });
      }
    }
  }

  String onValidateUsername(String value) {
    if (value == "") {
      return AppString.fieldEmpty;
    }

    if (value.contains(" ")) {
      return AppString.whiteSpaceError;
    }

    if (value.length < 3) {
      return AppString.usernameLength;
    }
    return null;
  }

  String onValidatePassword(String value) {
    if (value == "") {
      return AppString.fieldEmpty;
    }

    if (value.length < 8) {
      return AppString.passwordLength;
    }

    return null;
  }

  void onSignIn() {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (!_formKey.currentState.validate()) {
      print('Validate Triggered');
      return;
    }
    _formKey.currentState.save();

    BlocProvider.of<LoginBloc>(context).add(
      LoginUserEvent(
          email: _userNamecontroller.text.trim(),
          password: _passwordcontroller.text.trim()),
    );
  }
}
