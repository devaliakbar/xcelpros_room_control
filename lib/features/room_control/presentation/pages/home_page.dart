import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/widgets/app_background.dart';
import 'package:room_control/features/room_control/presentation/widgets/bottom_nav_bar.dart';
import 'package:room_control/features/room_control/presentation/widgets/home/home_background_elements.dart';
import 'package:room_control/features/room_control/presentation/widgets/home/home_body.dart';
import 'package:room_control/features/room_control/presentation/widgets/home/home_header.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      bottomNavigationBar: BottomNavBar(),
      body: AppBackground(
        child: Stack(
          children: [
            HomeBackgroundElements(),
            SafeArea(
              child: Column(
                children: [
                  HomeHeader(),
                  Expanded(
                    child: HomeBody(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
