import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/widgets/app_background.dart';
import 'package:room_control/features/room_control/presentation/widgets/bottom_nav_bar.dart';
import 'package:room_control/features/room_control/presentation/widgets/room/room_background_element.dart';
import 'package:room_control/features/room_control/presentation/widgets/room/room_body.dart';
import 'package:room_control/features/room_control/presentation/widgets/room/room_header.dart';

class RoomPage extends StatefulWidget {
  static const String routeName = '/room_page';

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  ///[hideSomeWidget] is for smoothing page transition. this variable controls the Body, and no: of light text
  bool hideSomeWidget = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(milliseconds: 300));
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
            SafeArea(
              child: Column(
                children: [
                  RoomHeader(hideNoOfLight: hideSomeWidget),
                  SizedBox(
                    height: 100,
                  ),
                  Expanded(
                    child: RoomBody(hideBody: hideSomeWidget),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
