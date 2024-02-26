import 'package:flutter/material.dart';

List<Widget> getTilesFrom(String URLimage, int division) {
  List<Widget> listTiles = [];
  Tile tile = Tile(imageURL: URLimage);
  double pas = 2.0 / (division - 1);
  for (var i = 0; i < division; i++) {
    for (var j = 0; j < division; j++) {
      listTiles.add(tile.croppedImageTile(
          nbTilesPerSide: division, x: -1 + j * pas, y: -1 + i * pas));
    }
  }
  return listTiles;
}

class Tile {
  String imageURL;

  Tile({required this.imageURL});

  Widget croppedImageTile(
      {int nbTilesPerSide = 4, double x = 0, double y = 0}) {
    // intervalles : de -1 à 1
    // pas : 2/(n-1)
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment(x, y),
            widthFactor: 1.0 / nbTilesPerSide,
            heightFactor: 1.0 / nbTilesPerSide,
            child: Image.network(imageURL),
          ),
        ),
      ),
    );
  }
}
