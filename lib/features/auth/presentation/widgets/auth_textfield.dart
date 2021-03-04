import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/ensure_visible.dart';
import 'package:room_control/core/services/size_config.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextInputType inputType;
  final TextEditingController controller;
  final bool obsecure;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onChanged;

  AuthTextField(
      {@required this.label,
      @required this.icon,
      this.controller,
      this.obsecure = false,
      this.validator,
      this.inputType = TextInputType.text,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          icon,
          size: IconSizes.iconSizeXL,
          color: AppColors.black,
        ),
        SizedBox(
          width: SizeConfig.widthWithoutSafeArea(7),
        ),
        Expanded(
          child: EnsureVisibleWhenFocused(
            child: TextFormField(
              onChanged: onChanged,
              controller: controller,
              keyboardType: inputType,
              obscureText: obsecure,
              validator: validator,
              cursorColor: AppColors.black,
              style: TextStyle(
                  fontSize: FontSizes.fontSizeM, color: AppColors.black),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthWithoutSafeArea(1),
                ),
                errorStyle: TextStyle(fontSize: FontSizes.fontSizeS),
                hintStyle: TextStyle(
                    fontSize: FontSizes.fontSizeM, color: AppColors.grey),
                hintText: label,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black),
                ),
              ),
            ),
            focusNode: FocusNode(),
          ),
        )
      ],
    );
  }
}
