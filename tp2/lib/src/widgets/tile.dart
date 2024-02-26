import 'package:flutter/material.dart';

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({required this.imageURL, required this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(imageURL),
          ),
        ),
      ),
    );
  }
}
