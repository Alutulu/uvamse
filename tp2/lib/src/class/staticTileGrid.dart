import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tp2/src/class/staticTile.dart';
import 'package:tp2/src/class/tile.dart';

class StaticTileGrid {
  int size;
  List<List<StaticTile>> tileGrid = [];
  String imageURL;

  StaticTileGrid(this.size, this.imageURL) {
    List<StaticTile> tileList = _getTiles();
    tileGrid = to2DList(tileList);
  }

  List<List<StaticTile>> to2DList(List<StaticTile> liste) {
    List<List<StaticTile>> grid = [];
    for (var i = 0; i < size; i++) {
      List<StaticTile> row = [];
      for (var j = 0; j < size; j++) {
        row.add(liste[i * size + j]);
      }
      grid.add(row);
    }
    return grid;
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

  List<StaticTile> _getTiles() {
    List<StaticTile> listTiles = [];
    List<double> aligns =
        List.generate(size, (index) => -1 + (2.0 / (size - 1)) * index);
    for (var x in aligns) {
      for (var y in aligns) {
        var tile = StaticTile(imageURL: imageURL, x: x, y: y, division: size);
        listTiles.add(tile);
      }
    }
    return listTiles;
  }

  int index2Dto1D(int x, int y) => x * size + y;

  List<int> index1Dto2D(int index) => [index ~/ size, index % size];
}
