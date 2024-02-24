import 'package:flutter/material.dart';
import '../class/slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    var a=SliderExample();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            a,
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Amusez-vous avec cette image !!',
            ),
            Text(
              a.get_value().round().toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Image(image: AssetImage('assets/artwork_films_pokemon_4G_2022.jpg')),
            // Image(image: NetworkImage('https://picsum.photos/512/1024'))
          ],
        ),
      ),
    );
  }
}
