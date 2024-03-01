import 'package:flutter/material.dart';

class StaticTile {
  String imageURL;
  double x;
  double y;
  late Alignment alignment;
  bool isEmpty;
  int division;
  double sizeFactor = 1.0;

  StaticTile(
      {required this.imageURL,
      required this.x,
      required this.y,
      required this.division,
      this.isEmpty = false}) {
    alignment = Alignment(x, y);
    sizeFactor = 1.0 / division;
  }

  Widget toWidget() => FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: InkWell(
          child: Align(
              alignment: alignment,
              widthFactor: sizeFactor,
              heightFactor: sizeFactor,
              child: Image.network(isEmpty ? 'assets/blanc.jpg' : imageURL)),
        ),
      ));
}
