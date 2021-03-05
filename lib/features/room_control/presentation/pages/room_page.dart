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

class _RoomPageState extends State<RoomPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  ///[isPageLoaded] is for smoothing page transition.
  bool isPageLoaded = false;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(milliseconds: 700));
      setState(() {
        isPageLoaded = true;
      });
      animationController.forward();
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
                        RoomTitle(animationController: animationController),
                        RoomLamp(isPageLoaded: isPageLoaded),
                      ],
                    ),
                    RoomLights(
                      numberOfLights: 4,
                      animationController: animationController,
                    ),
                  ],
                ),
                Expanded(
                  child: RoomBody(showBody: isPageLoaded),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
