import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';

class RoomTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(
          SizeConfig.width(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: IconSizes.iconSizeS,
                      ),
                      SizedBox(
                        width: SizeConfig.width(1),
                      ),
                      NormalText(
                        "Bed",
                        color: Colors.white,
                        boldText: true,
                        size: FontSizes.fontSizeXXL,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.height(0.5),
                  ),
                  NormalText(
                    "Room",
                    color: Colors.white,
                    boldText: true,
                    size: FontSizes.fontSizeXXL,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.height(1.5),
            ),
            NormalText(
              "4 Lights",
              color: AppColors.yellowBulb,
              boldText: true,
              size: FontSizes.fontSizeL,
            ),
          ],
        ),
      ),
    );
  }
}
