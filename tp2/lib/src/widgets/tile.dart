import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = math.Random();

class TileGrid {
  int size;
  List<List<Tile>> tileGrid = [];
  String imageURL;

  TileGrid(this.size, this.imageURL) {
    List<Tile> tileList = _getTiles();
    for (var i = 0; i < size; i++) {
      List<Tile> row = [];
      for (var j = 0; j < size; j++) {
        row.add(tileList[i * size + j]);
      }
      tileGrid.add(row);
    }
  }

  List<Widget> toWidgetList() {
    List<Widget> listWidget = [];
    for (var i = 0; i < size; i++) {
      for (var j = 0; j < size; j++) {
        listWidget.add(tileGrid[j][i].toWidget());
      }
    }
    return listWidget;
  }

  List<Tile> _getTiles() {
    List<Tile> listTiles = [];
    List<double> aligns =
        List.generate(size, (index) => -1 + (2.0 / (size - 1)) * index);
    for (var x in aligns) {
      for (var y in aligns) {
        var tile = Tile(
            imageURL: imageURL, alignment: Alignment(x, y), division: size);
        listTiles.add(tile);
      }
    }

    return listTiles;
  }
}

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
