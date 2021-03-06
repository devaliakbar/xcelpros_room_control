import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_control/core/res/app_resources.dart';
import 'package:room_control/core/services/size_config.dart';
import 'package:room_control/core/widgets/normal_text.dart';
import 'package:room_control/features/room_control/presentation/providers/room_provider.dart';

class RoomBodyColors extends StatefulWidget {
  final AnimationController animationController;
  RoomBodyColors({@required this.animationController});

  @override
  _RoomBodyColorsState createState() => _RoomBodyColorsState();
}

class _RoomBodyColorsState extends State<RoomBodyColors> {
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animation =
        IntTween(begin: 17, end: 0).animate(widget.animationController);
    _animation.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  final List<Color> colors = [
    AppColors.bulb1,
    AppColors.bulb2,
    AppColors.bulb3,
    AppColors.bulb4,
    AppColors.bulb5,
    AppColors.bulb6
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          AppString.colors,
          size: FontSizes.fontSizeL,
          boldText: true,
          color: AppColors.blue,
        ),
        SizedBox(
          height: SizeConfig.height(3),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int index = 0; index < (colors.length + 2); index++)
              _buildColor(index),
            Expanded(
              flex: _animation.value,
              child: Container(),
            )
          ],
        )
      ],
    );
  }

  Widget _buildColor(int index) {
    return index == (colors.length + 1)
        ? Container(
            width: SizeConfig.width(5),
          )
        : Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  if (index != colors.length) {
                    Provider.of<RoomProvider>(context, listen: false)
                        .changeBulbColor(colors[index]);
                  }
                },
                child: Container(
                  width: SizeConfig.width(8),
                  height: SizeConfig.width(8),
                  padding: EdgeInsets.all(SizeConfig.width(1.8)),
                  decoration: BoxDecoration(
                    color:
                        (index == colors.length) ? Colors.white : colors[index],
                    shape: BoxShape.circle,
                  ),
                  child: (index == colors.length)
                      ? FittedBox(
                          child: Icon(
                            Icons.add_sharp,
                            color: AppColors.blue,
                          ),
                        )
                      : null,
                ),
              ),
            ),
          );
  }
}
