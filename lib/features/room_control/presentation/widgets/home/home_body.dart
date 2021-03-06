import 'package:flutter/material.dart';
import 'package:room_control/core/animation/animation_tag.dart';
import 'package:room_control/core/animation/custom_animation.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';
import 'package:room_control/features/room_control/domain/entities/room.dart';
import 'package:room_control/features/room_control/presentation/pages/room_page.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  final List<Room> rooms = [
    Room(roomName: "Bed Room", imagePath: AppImages.bed, noOfLight: 4),
    Room(
        roomName: "Living Room", imagePath: AppImages.livingRoom, noOfLight: 2),
    Room(roomName: "Kitchen", imagePath: AppImages.kitchen, noOfLight: 5),
    Room(roomName: "Bathroom", imagePath: AppImages.bathtube, noOfLight: 1),
    Room(roomName: "Outdoor", imagePath: AppImages.house, noOfLight: 5),
    Room(roomName: "Balcony", imagePath: AppImages.balcony, noOfLight: 2)
  ];

  final double margin = SizeConfig.width(5);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: AnimationTag.homeBody,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(right: margin, top: margin, bottom: margin),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeConfig.width(8)),
              topRight: Radius.circular(SizeConfig.width(8)),
            ),
          ),
          child: CustomAnimation(
            animationController: animationController,
            customAnimationType: CustomAnimationType.bottomToTop,
            widget: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: margin, bottom: SizeConfig.height(3)),
                  alignment: Alignment.topLeft,
                  child: NormalText(
                    AppString.allRooms,
                    color: AppColors.blue,
                    boldText: true,
                    size: FontSizes.fontSizeL,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: rooms.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return _buildCard(context, index);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, int index) {
    return InkWell(
      onTap: () async {
        animationController.reverse();
        await Navigator.pushNamed(context, RoomPage.routeName,
            arguments: rooms[index]);
        animationController.forward();
      },
      child: Container(
        margin: EdgeInsets.only(left: margin, bottom: margin),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              SizeConfig.width(7),
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        height: SizeConfig.width(40),
        width: SizeConfig.width(42.5),
        padding: EdgeInsets.all(SizeConfig.width(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              rooms[index].imagePath,
              fit: BoxFit.fitWidth,
              width: SizeConfig.width(15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalText(
                  rooms[index].roomName,
                  boldText: true,
                  size: FontSizes.fontSizeL,
                ),
                SizedBox(
                  height: SizeConfig.height(0.7),
                ),
                NormalText(
                  "${rooms[index].noOfLight} Light",
                  boldText: true,
                  color: AppColors.yellow,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
