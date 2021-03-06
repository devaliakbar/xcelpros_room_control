import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';

class RoomBodyColors extends StatelessWidget {
  final List<Color> colors = [
    AppColors.bulb1,
    AppColors.bulb2,
    AppColors.bulb3,
    AppColors.bulb4,
    AppColors.bulb5,
    AppColors.bulb6
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          "Colors",
          size: FontSizes.fontSizeL,
          boldText: true,
          color: AppColors.blue,
        ),
        SizedBox(
          height: SizeConfig.height(2),
        ),
        Row(
          children: [
            for (int index = 0; index < (colors.length + 1); index++)
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: EdgeInsets.all(SizeConfig.width(1.8)),
                    margin: EdgeInsets.only(right: SizeConfig.width(4)),
                    decoration: BoxDecoration(
                      color: (index == colors.length)
                          ? Colors.white
                          : colors[index],
                      shape: BoxShape.circle,
                    ),
                    child: (index == colors.length)
                        ? FittedBox(
                            child: Icon(
                              Icons.add_sharp,
                              color: AppColors.blue,
                            ),
                          )
                        : null,
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
