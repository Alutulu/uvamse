import 'package:flutter/material.dart';
import 'package:tp2/src/class/retourBtn.dart';
import 'package:tp2/src/class/tile.dart';
import 'package:tp2/src/class/tileGrid.dart';

class Exo6Screen extends StatefulWidget {
  const Exo6Screen({super.key});

  @override
  State<Exo6Screen> createState() => _Exo6Screen();
}

class _Exo6Screen extends State<Exo6Screen> {
  bool mirror = false;
  double rotateXValue = 0;
  double rotateZValue = 0;
  double scaleValue = 1;
  int division = 3;
  late TileGrid listetile;

  @override
  void initState() {
    super.initState();
    listetile =
        TileGrid(division, 'assets/bulbizarre.png', withBlankTile: true);
    updateTilesTapAction(listetile);
    print("lig ${listetile.ligBlankTile} col ${listetile.colBlankTile}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("6) Échange de tuiles"),
      ),
      body: Center(
        // child: Column(
        // children: [
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BoutonRetour.widget(context),
                  const SizedBox(height: 15),
                  SizedBox(
                      width: 500,
                      height: 500,
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: division,
                        children: listetile.toWidgetList(),
                      )),
                ])),
      ),
    );
  }

  updateTilesTapAction(TileGrid tileGrid) {
    for (var i = 0; i < tileGrid.size; i++) {
      for (var j = 0; j < tileGrid.size; j++) {
        tileGrid.tileGrid[i][j].onTapAction = tileGrid.canSwap(
                tileGrid.tileGrid[i][j].lig!, tileGrid.tileGrid[i][j].col!)
            ? () {
                setState(() {
                  tileGrid.swapTile(tileGrid.tileGrid[i][j].col!,
                      tileGrid.tileGrid[i][j].lig!);
                });
              }
            : () {};
      }
    }
  }
}
