import 'package:flutter/material.dart';
import 'package:tp2/src/widgets/retourBtn.dart';
import 'package:tp2/src/widgets/tile.dart';

class Exo5bScreen extends StatefulWidget {
  const Exo5bScreen({super.key});

  @override
  State<Exo5bScreen> createState() => _Exo5bScreen();
}

class _Exo5bScreen extends State<Exo5bScreen> {
  bool mirror = false;
  double rotateXValue = 0;
  double rotateZValue = 0;
  double scaleValue = 1;
  static int division = 3;

  List<Widget> listetile = getTilesFrom('assets/bulbizarre.png', division);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("5A) Page qui affiche des tuiles"),
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoutonRetour.widget(context),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: 500,
                      height: 500,
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: division,
                        children: listetile,
                      ))
                ],
              ))),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}
