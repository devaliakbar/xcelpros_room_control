import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/widgets/app_background.dart';
import 'package:room_control/features/room_control/presentation/widgets/bottom_nav_bar.dart';
import 'package:room_control/features/room_control/presentation/widgets/room/room_background_element.dart';
import 'package:room_control/features/room_control/presentation/widgets/room/room_body.dart';
import 'package:room_control/features/room_control/presentation/widgets/room/room_lamp.dart';
import 'package:room_control/features/room_control/presentation/widgets/room/room_lights.dart';
import 'package:room_control/features/room_control/presentation/widgets/room/room_title.dart';

class RoomPage extends StatefulWidget {
  static const String routeName = '/room_page';

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  ///[hideSomeWidget] is for smoothing page transition.
  bool hideSomeWidget = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(milliseconds: 700));
      setState(() {
        hideSomeWidget = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      bottomNavigationBar: BottomNavBar(),
      body: AppBackground(
        child: Stack(
          children: [
            RoomBackgroundElement(),
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RoomTitle(),
                        RoomLamp(hideLamp: hideSomeWidget),
                      ],
                    ),
                    RoomLights(
                      numberOfLights: 4,
                    ),
                  ],
                ),
                Expanded(
                  child: RoomBody(hideBody: hideSomeWidget),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
