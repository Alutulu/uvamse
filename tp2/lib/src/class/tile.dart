import 'package:flutter/material.dart';

class Tile {
  String imageURL;
  Alignment alignment;
  bool isEmpty;
  int division;
  double sizeFactor = 1.0;

  Tile(
      {required this.imageURL,
      required this.alignment,
      required this.division,
      this.isEmpty = false}) {
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
