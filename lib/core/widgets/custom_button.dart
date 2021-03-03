import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';

class CustomButton extends StatelessWidget {
  final Function onClick;
  final String title;
  final double width;

  CustomButton({@required this.onClick, @required this.title, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: SizeConfig.height(6.5),
      child: RaisedButton(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.width(1.5)),
        ),
        color: AppColors.secondary,
        disabledColor: AppColors.secondary,
        child: NormalText(
          title,
          color: Colors.white,
          boldText: true,
          size: FontSizes.fontSizeBML,
        ),
        onPressed: onClick,
      ),
    );
  }
}
