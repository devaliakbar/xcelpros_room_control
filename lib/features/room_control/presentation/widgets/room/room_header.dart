import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';

class RoomHeader extends StatelessWidget {
  final bool hideNoOfLight;
  RoomHeader({@required this.hideNoOfLight});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          hideNoOfLight
              ? Container()
              : NormalText(
                  "4 Lights",
                  color: AppColors.yellow,
                  boldText: true,
                  size: FontSizes.fontSizeL,
                ),
        ],
      ),
    );
  }
}
