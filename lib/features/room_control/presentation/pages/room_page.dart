import 'package:flutter/material.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
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
  bool hideBody = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        hideBody = false;
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
                  RoomHeader(),
                  SizedBox(
                    height: 100,
                  ),
                  Expanded(
                    child: Hero(
                      tag: AnimationTag.homeBody,
                      child: Container(
                          padding: EdgeInsets.all(SizeConfig.width(5)),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(SizeConfig.width(8)),
                              topRight: Radius.circular(SizeConfig.width(8)),
                            ),
                          ),
                          child: hideBody ? Container() : RoomBody()),
                    ),
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
