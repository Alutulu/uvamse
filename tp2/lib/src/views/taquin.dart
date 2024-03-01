import 'package:flutter/material.dart';
import 'package:tp2/src/class/retourBtn.dart';
import 'package:tp2/src/class/tile.dart';
import 'package:tp2/src/class/tileGrid.dart';

class TaquinScreen extends StatefulWidget {
  const TaquinScreen({super.key});

  @override
  State<TaquinScreen> createState() => _TaquinScreen();
}

class _TaquinScreen extends State<TaquinScreen> {
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
        TileGrid(division, 'assets/lutti-pokemon.png', withBlankTile: true);
    updateTilesTapAction();
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
                  Slider(
                    value: division.toDouble(),
                    label: division.round().toString(),
                    max: 10,
                    min: 1,
                    divisions: 10,
                    onChanged: (double value) {
                      if (value.toInt() != division) {
                        setState(() {
                          division = value.toInt();
                          listetile = TileGrid(
                              division, 'assets/lutti-pokemon.png',
                              withBlankTile: true);
                          updateTilesTapAction();
                        });
                      }
                    },
                  )
                ])),
      ),
    );
  }

  updateTilesTapAction() {
    for (var i = 0; i < listetile.size; i++) {
      for (var j = 0; j < listetile.size; j++) {
        listetile.tileGrid[i][j].onTapAction = () {
          setState(() {
            listetile.tileGrid[i][j].action();
            // listetile.updateActions();
            updateTilesTapAction();
          });
        };
      }
    }
  }
}
