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
    listetile = TileGrid(division, 'assets/lutti-pokemon.png',
        withBlankTile: true, mustShuffle: false);
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
            padding: const EdgeInsets.all(16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BoutonRetour.widget(context),
                  const SizedBox(height: 15),
                  SizedBox(
                      width: 300,
                      height: 300,
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: division,
                        children: listetile.toWidgetList(),
                      )),
                  Slider(
                    value: division.toDouble(),
                    label: division.round().toString(),
                    max: 10,
                    min: 2,
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Shuffle : "),
                      const SizedBox(width: 30),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            listetile.shuffle(1);
                            updateTilesTapAction();
                          });
                        },
                        child: const Text('x1'),
                      ),
                      const SizedBox(width: 30),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            listetile.shuffle(3);
                            updateTilesTapAction();
                          });
                        },
                        child: const Text('x3'),
                      ),
                      const SizedBox(width: 30),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            listetile.shuffle(10);
                            updateTilesTapAction();
                          });
                        },
                        child: const Text('x10'),
                      ),
                      const SizedBox(width: 30),
                      const Text('(Press several times)')
                    ],
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
            updateTilesTapAction();
          });
        };
      }
    }
  }
}
