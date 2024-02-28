import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tp2/src/class/tile.dart';
import 'dart:collection';

math.Random random = math.Random();

class TileGrid {
  int size;
  List<List<Tile>> tileGrid = [];
  String imageURL;
  int? ligBlankTile;
  int? colBlankTile;
  int? idLigBlankTile;
  int? idColBlankTile;

  TileGrid(this.size, this.imageURL, {bool withBlankTile = false}) {
    List<Tile> tileList = _getTiles();
    tileGrid = to2DList(tileList);
    if (withBlankTile) addRandomBlankTile();
    updateTilesCoord();
    updateActions();
  }

  List<List<Tile>> to2DList(List<Tile> liste) {
    List<List<Tile>> grid = [];
    for (var i = 0; i < size; i++) {
      List<Tile> row = [];
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

  void addRandomBlankTile() {
    int idRandom = random.nextInt(size * size);
    var coordRandom = index1Dto2D(idRandom);
    int x = coordRandom[0];
    int y = coordRandom[1];
    makeTileBlank(x, y);
  }

  void makeTileBlank(int x, int y) {
    tileGrid[x][y].isEmpty = true;
    ligBlankTile = y;
    colBlankTile = x;
    idLigBlankTile = x;
    idColBlankTile = y;
  }

  void swapTile(int x, int y) {
    print('swap ($y, $x)');
    List<List<Tile>> newGrid = [];
    for (var i = 0; i < size; i++) {
      List<Tile> row = [];
      for (var j = 0; j < size; j++) {
        if (i == idLigBlankTile && j == idColBlankTile) {
          row.add(tileGrid[x][y]);
        } else if (i == x && j == y) {
          row.add(tileGrid[idLigBlankTile!][idColBlankTile!]);
        } else {
          row.add(tileGrid[i][j]);
        }
      }
      newGrid.add(row);
    }
    tileGrid = newGrid;
    var temp_x = ligBlankTile!;
    var temp_y = colBlankTile!;
    makeTileBlank(x, y);
    updateTilesCoord();
    updateActions();
  }

  bool canSwap(int x, int y) {
    return ((x - idLigBlankTile!).abs() == 1 && y == idColBlankTile!) ||
        (x == idLigBlankTile! && (y - idColBlankTile!).abs() == 1);
  }

  void updateTilesCoord() {
    for (var i = 0; i < size; i++) {
      for (var j = 0; j < size; j++) {
        tileGrid[i][j].lig = j;
        tileGrid[i][j].col = i;
        tileGrid[i][j].idLig = i;
        tileGrid[i][j].idCol = j;
      }
    }
  }

  void updateActions() {
    for (var i = 0; i < size; i++) {
      for (var j = 0; j < size; j++) {
        if (canSwap(tileGrid[i][j].idLig!, tileGrid[i][j].idCol!)) {
          print('swap $j $i');
          tileGrid[i][j].action = () {
            swapTile(tileGrid[i][j].idLig!, tileGrid[i][j].idCol!);
          };
        } else {
          print('pas swap $j $i');
          tileGrid[i][j].action = () {
            print("${tileGrid[i][j].idLig} et ${tileGrid[i][j].idCol}");
          };
        }
        ;
      }
    }
  }
}
