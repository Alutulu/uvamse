import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tp2/src/class/tile.dart';

math.Random random = math.Random();

class TileGrid {
  int size;
  List<List<Tile>> tileGrid = [];
  String imageURL;
  int? ligBlankTile;
  int? colBlankTile;

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
    updateTilesCoord();
    updateTilesTapAction();
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
        var tile = Tile(imageURL: imageURL, x: x, y: y, division: size);
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
    tileGrid[x][y].isEmpty = true;
    ligBlankTile = y;
    colBlankTile = x;
  }

  void swapTile(int x, int y) {
    copyTile(x, y, ligBlankTile!, colBlankTile!);
    makeTileBlank(x, y);
  }

  void copyTile(int x1, int y1, int x2, int y2) {
    tileGrid[x2][y2].isEmpty = false;
    tileGrid[x2][y2].alignment =
        Alignment(tileGrid[x1][y1].alignment.x, tileGrid[x1][y1].alignment.y);
  }

  bool canSwap(int x, int y) =>
      ((x - ligBlankTile!).abs() == 1 && y == colBlankTile!) ||
      (x == ligBlankTile! && (y - colBlankTile!).abs() == 1);

  void updateTilesCoord() {
    for (var i = 0; i < size; i++) {
      for (var j = 0; j < size; j++) {
        tileGrid[i][j].lig = j;
        tileGrid[i][j].col = i;
      }
    }
  }

  void updateTilesTapAction() {
    for (var i = 0; i < size; i++) {
      for (var j = 0; j < size; j++) {
        tileGrid[i][j].onTapAction =
            canSwap(tileGrid[i][j].lig!, tileGrid[i][j].col!)
                ? () {
                    swapTile(tileGrid[i][j].lig!, tileGrid[i][j].col!);
                    print('${tileGrid[i][j].isEmpty}');
                    print('swap !');
                  }
                : () {
                    print('pas de swap !');
                  };
      }
    }
  }
}
