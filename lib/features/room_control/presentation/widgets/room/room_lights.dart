import 'package:flutter/material.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';
import 'package:room_control/features/room_control/domain/entities/light.dart';

class RoomLights extends StatefulWidget {
  final int numberOfLights;

  RoomLights({@required this.numberOfLights});

  @override
  _RoomLightsState createState() => _RoomLightsState();
}

class _RoomLightsState extends State<RoomLights> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    if (widget.numberOfLights > 1) {
      selectedIndex = 1;
    }
  }

  final List<Light> lights = [
    Light(name: "Main Light", icon: Icons.bubble_chart),
    Light(name: "Desk Light", icon: Icons.bubble_chart),
    Light(name: "Bed Light", icon: Icons.bubble_chart),
    Light(name: "Main Light", icon: Icons.bubble_chart),
    Light(name: "Desk Light", icon: Icons.bubble_chart)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
        left: SizeConfig.width(5),
        top: SizeConfig.width(3),
        bottom: SizeConfig.width(9),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int index = 0; index < widget.numberOfLights; index++)
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Card(
                  color: selectedIndex == index
                      ? AppColors.secondary
                      : Colors.white,
                  margin: EdgeInsets.only(
                    right: SizeConfig.width(5),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SizeConfig.width(3.5)),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.width(3),
                        horizontal: SizeConfig.width(4)),
                    child: Row(
                      children: [
                        Icon(
                          lights[index].icon,
                          size: IconSizes.iconSizeL,
                          color: selectedIndex == index
                              ? Colors.white
                              : AppColors.secondary,
                        ),
                        SizedBox(
                          width: SizeConfig.width(2),
                        ),
                        NormalText(
                          lights[index].name,
                          boldText: true,
                          color: selectedIndex == index
                              ? Colors.white
                              : AppColors.secondary,
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
