import 'package:flutter/material.dart';
import 'package:tp2/src/utils/math.dart';
import 'package:tp2/src/widgets/tile.dart';

class Exo4Screen extends StatefulWidget {
  const Exo4Screen({super.key});

  @override
  State<Exo4Screen> createState() => _Exo4Screen();
}

class _Exo4Screen extends State<Exo4Screen> {
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
        title: const Text("4) Affichage d'une tuile"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                // width: 150.0,
                // height: 150.0,
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
