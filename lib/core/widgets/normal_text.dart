import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';

class NormalText extends StatelessWidget {
  final String text;
  final Color color;
  final bool boldText;
  final double size;
  final bool truncate;

  NormalText(
    this.text, {
    this.color,
    this.boldText = false,
    this.size,
    this.truncate = false,
  });

  @override
  Widget build(BuildContext context) {
    TextOverflow overflowStyle = TextOverflow.visible;
    if (truncate) {
      overflowStyle = TextOverflow.clip;
    }

    return Text(
      text,
      overflow: overflowStyle,
      style: TextStyle(
          color: color == null ? AppColors.black : color,
          fontSize: size == null ? FontSizes.fontSizeM : size,
          fontWeight: boldText ? FontWeight.bold : FontWeight.normal),
    );
  }
}
