import 'package:flutter/material.dart';
import 'package:tp2/src/class/retourBtn.dart';
import 'package:tp2/src/class/tile.dart';
import 'package:tp2/src/class/tileGrid.dart';

class Exo5cScreen extends StatefulWidget {
  const Exo5cScreen({super.key});

  @override
  State<Exo5cScreen> createState() => _Exo5cScreen();
}

class _Exo5cScreen extends State<Exo5cScreen> {
  bool mirror = false;
  double rotateXValue = 0;
  double rotateZValue = 0;
  double scaleValue = 1;
  static int division = 3;

  var listetile = TileGrid(division, 'assets/bulbizarre.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("5C) Division d'image à l'aide d'un slider"),
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
                      width: 400,
                      height: 400,
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: division,
                        children: listetile.toWidgetList(),
                        //faire une class gridview por pouvoir mettre un setstate
                      )),
                  Slider(
                    value: division.toDouble(),
                    label: division.round().toString(),
                    max: 10,
                    min: 1,
                    divisions: 10,
                    onChanged: (double value) {
                      setState(() {
                        division = value.toInt();
                        listetile = TileGrid(division, 'assets/bulbizarre.png');
                      });
                    },
                  )
                ])),
      ),
    );
  }
}
