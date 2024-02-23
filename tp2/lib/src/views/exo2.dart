import 'package:flutter/material.dart';
import '../../../class/slider.dart';

class Exo2Screen extends StatelessWidget {
  const Exo2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jeu du Taquin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
