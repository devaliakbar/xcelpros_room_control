import 'package:flutter/material.dart';

class Room {
  final String roomName;
  final String imagePath;
  final int noOfLight;

  Room(
      {@required this.roomName,
      @required this.imagePath,
      @required this.noOfLight});
}
