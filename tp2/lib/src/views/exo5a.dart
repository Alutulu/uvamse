import 'package:flutter/material.dart';
import 'package:tp2/src/utils/math.dart';
import 'package:tp2/src/widgets/tile.dart';

class Exo5aScreen extends StatefulWidget {
  const Exo5aScreen({super.key});

  @override
  State<Exo5aScreen> createState() => _Exo5aScreen();
}

class _Exo5aScreen extends State<Exo5aScreen> {
  bool mirror = false;
  double rotateXValue = 0;
  double rotateZValue = 0;
  double scaleValue = 1;

  Tile tile = Tile(imageURL: 'assets/artwork_films_pokemon_4G_2022.jpg');

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
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text("He'd have you all unravel at the"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[200],
                    child: const Text('Heed not the rabble'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[300],
                    child: const Text('Sound of screams but the'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[400],
                    child: const Text('Who scream'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[500],
                    child: const Text('Revolution is coming...'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[600],
                    child: const Text('Revolution, they...'),
                  ),
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