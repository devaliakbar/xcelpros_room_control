import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/features/room_control/presentation/providers/room_provider.dart';

class RoomLamp extends StatelessWidget {
  final isPageLoaded;
  RoomLamp({@required this.isPageLoaded});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: SizeConfig.width(5),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Consumer<RoomProvider>(
                    builder: (context, roomController, child) {
                  Color bulbColor = AppColors.yellowBulb;

                  if (isPageLoaded) {
                    bulbColor = roomController.bulbColor
                        .withOpacity(roomController.bulbIntensity);
                  }

                  if (isPageLoaded && (roomController.bulbIntensity < 0.15)) {
                    bulbColor = Colors.black.withOpacity(0.5);
                  }

                  return Container(
                    height: SizeConfig.width(3),
                    width: SizeConfig.width(6),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: bulbColor,
                          blurRadius: SizeConfig.width(3),
                          spreadRadius: SizeConfig.width(0.5),
                        ),
                      ],
                      color: bulbColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          SizeConfig.width(3),
                        ),
                        bottomRight: Radius.circular(
                          SizeConfig.width(3),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: SizeConfig.width(3)),
            child: Column(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: SizeConfig.width(1.5),
                  height:
                      SizeConfig.heightWithoutSafeArea(isPageLoaded ? 9 : 4),
                  color: Colors.white,
                ),
                Image.asset(
                  AppImages.lamp,
                  width: SizeConfig.width(38),
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
