import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tp2/src/widgets/retourBtn.dart';
import 'package:tp2/src/widgets/tile.dart';
import 'dart:math' as math;

// List<Widget> listetile = [];
// int division = 7;
// Tile blank = Tile(imageURL: "");
// int indexBlanc = 0;

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

  math.Random random = math.Random();
  var n = 0;

  // @override
  // initState() {
  //   super.initState();

  //   listetile = getTilesFrom('assets/bulbizarre.png', division);
  //   n = random.nextInt(listetile.length - 1);
  //   print(n);
  //   listetile[n] = blank.croppedImageTile();
  //   indexBlanc = n;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("6) Permutation de tuiles"),
        ),
        body: const Center(
          // child: Column(
          // children: [
          child: Padding(
            padding: EdgeInsets.all(8),
            // child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       BoutonRetour.widget(context),
            //       const SizedBox(height: 15),
            //       SizedBox(
            //           width: 500,
            //           height: 500,
            //           child: GridView.count(
            //             primary: false,
            //             padding: const EdgeInsets.all(20),
            //             crossAxisSpacing: 10,
            //             mainAxisSpacing: 10,
            //             crossAxisCount: division,
            //             children: listetile,
            //           )),
            //       FloatingActionButton(onPressed: swaptiles)
            //     ])),)
          ),
        ));
  }
}
//   swaptiles() {
//     setState(() {
//       Tile test =
//           Tile(imageURL: 'assets/tp2/assets/artwork_films_pokemon_4G_2022.jpg');
//       listetile[0] = test.croppedImageTile();
//       print("rentré");
//     });
//   }

//   Widget createTileWidgetFrom(Tile tile) {
//     return InkWell(
//       child: tile.croppedImageTile(),
//       onTap: () {
//         print("tapped on tile");
//       },
//     );
//   }
// }

// void deplacement(int lig, int col) {
//   print("premier test");
//   if (col != division - 1 && lig * division + col + 1 == indexBlanc) {
//     listetile[lig * division + col + 1] = listetile[lig * division + col];
//     listetile[lig * division + col] = blank.croppedImageTile();
//   } else {
//     print("tentative raté");
//   }
// }
