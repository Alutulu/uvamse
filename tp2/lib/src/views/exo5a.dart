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

  Tile tile = Tile(
      imageURL: 'assets/artwork_films_pokemon_4G_2022.jpg',
      alignment: const Alignment(0, 0));

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
          children: <Widget>[
            SizedBox(
                width: 150.0,
                height: 150.0,
                child: Container(
                    margin: const EdgeInsets.all(20.0),
                    child: createTileWidgetFrom(tile))),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(color: Colors.white),
              clipBehavior: Clip.hardEdge,
              child: Transform(
                  alignment: Alignment.center,
                  transform: perspective.scaled(1, 1, 1)
                    ..rotateX(deg2rad(rotateXValue)),
                  child: Transform.rotate(
                      angle: deg2rad(rotateZValue),
                      child: Transform.flip(
                        flipY: mirror,
                        child: Transform.scale(
                          alignment: Alignment.center,
                          scale: scaleValue,
                          child: const Image(
                              image: AssetImage(
                                  'assets/artwork_films_pokemon_4G_2022.jpg')),
                        ),
                      ))),
            ),
          ],
        ),
      )),
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
