import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tp2/src/class/tile.dart';

math.Random random = math.Random();

class TileGrid {
  int size;
  List<List<Tile>> tileGrid = [];
  String imageURL;
  int? xBlankTile;
  int? yBlankTile;

  TileGrid(this.size, this.imageURL, {bool withBlankTile = false}) {
    List<Tile> tileList = _getTiles();
    for (var i = 0; i < size; i++) {
      List<Tile> row = [];
      for (var j = 0; j < size; j++) {
        row.add(tileList[i * size + j]);
      }
      tileGrid.add(row);
    }
    if (withBlankTile) addRandomBlankTile();
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

  int index2Dto1D(int x, int y) => x * size + y;

  List<int> index1Dto2D(int index) => [index ~/ size, index % size];

  List<int> addRandomBlankTile() {
    int idRandom = random.nextInt(size * size);
    var coordRandom = index1Dto2D(idRandom);
    int x = coordRandom[0];
    int y = coordRandom[1];
    makeTileBlank(x, y);
    return [x, y];
  }

  void makeTileBlank(int x, int y) {
    tileGrid[x][y].isEmpty = false;
    xBlankTile = x;
    yBlankTile = y;
  }

  void swapTile(int x, int y) {}

  void copyTile(int x1, int y1, int x2, int y2) {
    tileGrid[x2][y2].isEmpty = true;
    tileGrid[x2][y2].alignment.x = tileGrid[x1][y1].alignment.x;
  }
}
