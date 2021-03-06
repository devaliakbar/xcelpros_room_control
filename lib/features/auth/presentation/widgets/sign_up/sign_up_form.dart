import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/res/icon/room_control_icons_icons.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/utils/utils.dart';
import 'package:room_control/core/widgets/custom_button.dart';
import 'package:room_control/core/widgets/normal_text.dart';
import 'package:room_control/features/auth/presentation/providers/sign_up/sign_up_provider.dart';
import 'package:room_control/features/auth/presentation/widgets/auth_textfield.dart';

class SignUpform extends StatefulWidget {
  final AnimationController animationController;

  SignUpform({@required this.animationController});

  @override
  _SignUpformState createState() => _SignUpformState();
}

class _SignUpformState extends State<SignUpform> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _userNamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  bool _acceptTerms = false;

  bool _isButtonDisable = true;

  @override
  void dispose() {
    _userNamecontroller.dispose();
    _passwordcontroller.dispose();
    _emailcontroller.dispose();
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomAnimation(
            customAnimationType: CustomAnimationType.bottomToTop,
            animationController: widget.animationController,
            playAnimation: false,
            widget: Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthTextField(
                    label: AppString.username,
                    icon: RoomControlIcons.Username,
                    controller: _userNamecontroller,
                    validator: onValidateUsername,
                    onChanged: onFormValueChange,
                  ),
                  SizedBox(
                    height: SizeConfig.heightWithoutSafeArea(4),
                  ),
                  AuthTextField(
                    label: AppString.password,
                    icon: RoomControlIcons.Password,
                    obsecure: true,
                    controller: _passwordcontroller,
                    validator: onValidatePassword,
                    onChanged: onFormValueChange,
                  ),
                  SizedBox(
                    height: SizeConfig.heightWithoutSafeArea(4),
                  ),
                  AuthTextField(
                    label: AppString.email,
                    icon: RoomControlIcons.Email,
                    inputType: TextInputType.emailAddress,
                    controller: _emailcontroller,
                    validator: onValidateEmail,
                    onChanged: onFormValueChange,
                    iconSize: IconSizes.iconSizeBXSS,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              CustomAnimation(
                animationController: widget.animationController,
                playAnimation: false,
                customAnimationType: CustomAnimationType.bottomToTop,
                widget: InkWell(
                  onTap: () {
                    _acceptTerms = !_acceptTerms;
                    setState(() {});
                    onFormValueChange(null);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _acceptTerms
                            ? Icons.check_box_rounded
                            : Icons.check_box_outline_blank_outlined,
                        size: IconSizes.iconSizeM,
                        color:
                            _acceptTerms ? AppColors.secondary : AppColors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      NormalText(
                        AppString.iHaveAccept,
                        color: AppColors.grey,
                        size: FontSizes.fontSizeBXSS,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      InkWell(
                        onTap: () {},
                        child: NormalText(
                          AppString.termsCondition,
                          boldText: true,
                          color: AppColors.secondary,
                          size: FontSizes.fontSizeBXSS,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightWithoutSafeArea(4),
              ),
              Hero(
                tag: AnimationTag.authButton,
                child: CustomButton(
                  animationController: widget.animationController,
                  customAnimationType: CustomAnimationType.bottomToTop,
                  onClick: _isButtonDisable ? null : onSignUp,
                  title: AppString.signUp.toUpperCase(),
                  width: double.infinity,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void onFormValueChange(String _) {
    String username = _userNamecontroller.text.trim();
    String password = _passwordcontroller.text.trim();
    String email = _emailcontroller.text.trim();

    if (username != "" && password != "" && email != "" && _acceptTerms) {
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

  String onValidateEmail(String value) {
    if (value == "") {
      return AppString.fieldEmpty;
    }
    if (!Utils.isEmail(value)) {
      return AppString.enterValidEmail;
    }
    return null;
  }

  void onSignUp() {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (!_formKey.currentState.validate()) {
      print('Validate Triggered');
      return;
    }
    _formKey.currentState.save();

    Provider.of<SignUpProvider>(context, listen: false).signUp(
      username: _userNamecontroller.text.trim(),
      email: _emailcontroller.text.trim(),
      password: _passwordcontroller.text.trim(),
    );
  }
}
