import 'package:flutter/material.dart';
import '../class/slider.dart';

class Exo2Screen extends StatefulWidget {
  const Exo2Screen({super.key});

  @override
  State<Exo2Screen> createState() => _Exo2Screen();
}

class _Exo2Screen extends State<Exo2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Exercice 2 : Un slider'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SliderExample(),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Amusez-vous avec cette image !!',
            ),
            Image(
                image: AssetImage('assets/artwork_films_pokemon_4G_2022.jpg')),
            // Image(image: NetworkImage('https://picsum.photos/512/1024'))
          ],
        ),
      ),
    );
  }
}
