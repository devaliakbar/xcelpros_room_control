import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/widgets/app_background.dart';
import 'package:room_control/features/room_control/presentation/providers/room_provider.dart';
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

  bool isPageLoaded = false;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      //WAITING FOR PAGE TO COMPLETE ROUTE ANIMATION
      await Future.delayed(Duration(milliseconds: 700));

      //SETTING BULB COLOR TO YELLOW (DEFAULT)
      Provider.of<RoomProvider>(context, listen: false)
          .changeBulbColor(AppColors.yellowBulb);

      setState(() {
        isPageLoaded = true;
      });
      animationController.forward();
    });

    //SETTING INTENSITY SLIDER ANIMATION
    animationController.addListener(() {
      Provider.of<RoomProvider>(context, listen: false)
          .changeBulbIntensity(animationController.value);
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
                  child: RoomBody(
                      animationController: animationController,
                      isPageLoaded: isPageLoaded),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
