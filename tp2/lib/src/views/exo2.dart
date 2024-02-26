import 'package:flutter/material.dart';

class Exo2Screen extends StatefulWidget {
  const Exo2Screen({super.key});

  @override
  State<Exo2Screen> createState() => _Exo2Screen();
}

class _Exo2Screen extends State<Exo2Screen> {
  bool? mirror = true;
  double rotateXValue = 0;
  double rotateZValue = 0;
  double scaleValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Exercice 2 : Un slider'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
                image: AssetImage('assets/artwork_films_pokemon_4G_2022.jpg')),
            // Image(image: NetworkImage('https://picsum.photos/512/1024'))

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text('Rotate X'),
                Expanded(
                    child: Slider(
                  value: rotateXValue,
                  label: rotateXValue.round().toString(),
                  max: 180,
                  min: -180,
                  divisions: 360,
                  onChanged: (double value) {
                    setState(() {
                      rotateXValue = value;
                    });
                  },
                ))
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text('Rotate Z'),
                Expanded(
                    child: Slider(
                  value: rotateZValue,
                  label: rotateZValue.round().toString(),
                  max: 180,
                  min: -180,
                  divisions: 360,
                  onChanged: (double value) {
                    setState(() {
                      rotateZValue = value;
                    });
                  },
                ))
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text('Mirror'),
                Checkbox(
                    value: mirror,
                    onChanged: (bool? value) {
                      setState(() {
                        mirror = value;
                      });
                    }),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text('Scale'),
                Expanded(
                    child: Slider(
                  value: scaleValue,
                  label: scaleValue.toStringAsFixed(1),
                  max: 3,
                  min: 0.1,
                  divisions: 360,
                  onChanged: (double value) {
                    setState(() {
                      scaleValue = value;
                    });
                  },
                ))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
