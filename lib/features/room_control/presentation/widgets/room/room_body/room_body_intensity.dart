import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/res/icon/room_control_icons_icons.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';
import 'package:room_control/features/room_control/presentation/providers/room_provider.dart';

class RoomBodyIntensity extends StatelessWidget {
  final bool isPageLoaded;
  RoomBodyIntensity({@required this.isPageLoaded});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          AppString.intensity,
          size: FontSizes.fontSizeL,
          boldText: true,
          color: AppColors.blue,
        ),
        SizedBox(
          height: SizeConfig.height(2),
        ),
        Row(
          children: [
            Icon(
              RoomControlIcons.BulbLow,
              size: IconSizes.iconSizeM,
              color: AppColors.bulbGrey,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: Consumer<RoomProvider>(
                      builder: (context, roomController, child) {
                        return CupertinoSlider(
                          max: 1,
                          min: 0,
                          activeColor: AppColors.yellowBulb,
                          value:
                              isPageLoaded ? roomController.bulbIntensity : 0,
                          onChanged: (double newIntensity) {
                            if (isPageLoaded) {
                              roomController.changeBulbIntensity(newIntensity);
                            }
                          },
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: SizeConfig.width(2),
                    right: SizeConfig.width(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 6; i++)
                          Container(
                            height: SizeConfig.height(0.8),
                            width: SizeConfig.width(0.5),
                            color: AppColors.bulbGrey.withOpacity(0.8),
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Icon(
              RoomControlIcons.BulbHigh,
              size: IconSizes.iconSizeL,
              color: AppColors.yellowBulb,
            ),
          ],
        )
      ],
    );
  }
}
