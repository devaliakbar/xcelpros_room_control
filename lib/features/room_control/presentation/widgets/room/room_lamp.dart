import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';

class RoomLamp extends StatefulWidget {
  final bool hideLamp;
  RoomLamp({@required this.hideLamp});

  @override
  _RoomLampState createState() => _RoomLampState();
}

class _RoomLampState extends State<RoomLamp> {
  bool _growLamp = false;

  @override
  void initState() {
    super.initState();
    setUpLampGrowth();
  }

  @override
  Widget build(BuildContext context) {
    return widget.hideLamp
        ? Container()
        : Container(
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
                      Container(
                        height: SizeConfig.width(3),
                        width: SizeConfig.width(6),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.yellowBulb,
                              blurRadius: SizeConfig.width(3),
                              spreadRadius: SizeConfig.width(0.5),
                            ),
                          ],
                          color: AppColors.yellowBulb,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              SizeConfig.width(3),
                            ),
                            bottomRight: Radius.circular(
                              SizeConfig.width(3),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: SizeConfig.width(3)),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: SizeConfig.width(1.5),
                        height:
                            SizeConfig.heightWithoutSafeArea(_growLamp ? 9 : 4),
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

  Future<void> setUpLampGrowth() async {
    await Future.delayed(Duration(milliseconds: 800));
    setState(() {
      _growLamp = true;
    });
  }
}
