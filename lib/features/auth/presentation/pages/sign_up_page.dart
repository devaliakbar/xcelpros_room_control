import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';
import 'package:room_control/features/auth/presentation/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  static const String routeName = '/signup_page';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.heightWithoutSafeArea(100),
          width: SizeConfig.widthWithoutSafeArea(100),
          decoration: BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.centerLeft,
              colors: [
                AppColors.primary,
                AppColors.primaryLite,
              ],
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Hero(
                  tag: "mask",
                  child: Image.asset(
                    AppImages.authMask,
                    height: SizeConfig.heightWithoutSafeArea(20),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.height(4),
                        left: SizeConfig.widthWithoutSafeArea(13)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                            size: IconSizes.iconSizeM,
                          ),
                          SizedBox(
                            width: SizeConfig.widthWithoutSafeArea(2),
                          ),
                          NormalText(
                            "Back",
                            color: Colors.white,
                            boldText: true,
                            size: FontSizes.fontSizeBML,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: SizeConfig.heightWithoutSafeArea(80),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthWithoutSafeArea(13),
                        ),
                        child: Hero(
                          tag: "title",
                          child: Material(
                            color: Colors.transparent,
                            child: NormalText(
                              "Create New Account ",
                              color: Colors.white,
                              size: FontSizes.fontSizeXL,
                              truncate: true,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SignUpform(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
