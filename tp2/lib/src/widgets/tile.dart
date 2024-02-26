import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import 'package:tp2/src/views/exo6.dart';

math.Random random = new math.Random();

List<Widget> getTilesFrom(String URLimage, int division) {
  List<Widget> listTiles = [];

  Tile tile = Tile(imageURL: URLimage);
  tile.col = 0;
  tile.lig = 0;
  if (division == 1) {
    listTiles.add(tile.croppedImageTile(nbTilesPerSide: 1, x: 0, y: 0));
  } else {
    double pas = 2.0 / (division - 1);
    for (var i = 0; i < division; i++) {
      for (var j = 0; j < division; j++) {
        listTiles.add(tile.croppedImageTile(
            nbTilesPerSide: division,
            x: -1 + j * pas,
            y: -1 + i * pas,
            lig: i,
            col: j));
        tile.col++;
      }
      tile.lig++;
    }
  }

  return listTiles;
}

class Tile {
  String imageURL;
  int lig = 0;
  int col = 0;

  Tile({required this.imageURL});

  bool isEmpty() => imageURL == "";

  // Widget tileWidget = this.croppedImageTile()

  Widget croppedImageTile(
      {int nbTilesPerSide = 4, double x = 0, double y = 0, lig = 0, col = 0}) {
    // intervalles : de -1 à 1
    // pas : 2/(n-1)
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
            child: InkWell(
          onTap: () {
            deplacement(lig, col);
          },
          child: Align(
              alignment: Alignment(x, y),
              widthFactor: 1.0 / nbTilesPerSide,
              heightFactor: 1.0 / nbTilesPerSide,
              child: !isEmpty()
                  ? Image.network(imageURL)
                  : Image.network('assets/blanc.jpg')),
        )),
      ),
    );
  }
}
