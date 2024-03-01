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
  int? idLigBlankTile;
  int? idColBlankTile;
  int? idLigLastShuffled;
  int? idColLastShuffled;
  int nbDep = 0;

  TileGrid(this.size, this.imageURL,
      {bool withBlankTile = false, bool mustShuffle = false}) {
    List<Tile> tileList = _getTiles();
    tileGrid = to2DList(tileList);
    if (withBlankTile) addRandomBlankTile();
    if (mustShuffle) shuffle(15);
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

  void swapTile(int x, int y, {bool updateShuffle = false}) {
    if (updateShuffle) {
      if (idLigLastShuffled != null) {
        tileGrid[idLigLastShuffled!][idColLastShuffled!].hasSwaped = false;
      }
    }
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
    if (updateShuffle) {
      idLigLastShuffled = idLigBlankTile;
      idColLastShuffled = idColBlankTile;
      tileGrid[idLigLastShuffled!][idColLastShuffled!].hasSwaped = true;
    } else {
      nbDep++;
    }
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
          tileGrid[i][j].action = () {
            swapTile(tileGrid[i][j].idLig!, tileGrid[i][j].idCol!);
          };
        } else {
          tileGrid[i][j].action = () {};
        }
      }
    }
  }

  List<List<int>> getSwapableTilesCoords() {
    List<List<int>> listeCoords = [];
    var deltaX = [0, 1, 0, -1];
    var deltaY = [-1, 0, 1, 0];
    for (var i = 0; i < 4; i++) {
      var idX = idLigBlankTile! + deltaX[i];
      var idY = idColBlankTile! + deltaY[i];
      if (0 <= idX && idX < size && 0 <= idY && idY < size) {
        if (!tileGrid[idX][idY].hasSwaped) {
          listeCoords.add([idX, idY]);
        }
      }
    }
    return listeCoords;
  }

  void shuffle(int nbSwaps) {
    for (var i = 0; i < nbSwaps; i++) {
      var listeCoords = getSwapableTilesCoords();
      var idCoord = random.nextInt(listeCoords.length);
      swapTile(listeCoords[idCoord][0], listeCoords[idCoord][1],
          updateShuffle: true);
    }
  }
}
