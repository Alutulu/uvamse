import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp2/src/views/exo2.dart';
import 'package:tp2/src/views/exo4.dart';
import 'package:tp2/src/views/exo5a.dart';
import 'package:tp2/src/views/exo5b.dart';
import 'package:tp2/src/views/exo5c.dart';
import 'package:tp2/src/views/home.dart';

final appShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'app shell');

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Jeu du Taquin',
      routerConfig: GoRouter(routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        GoRoute(path: '/2', builder: (context, state) => const Exo2Screen()),
        GoRoute(path: '/4', builder: (context, state) => const Exo4Screen()),
        GoRoute(path: '/5a', builder: (context, state) => const Exo5aScreen()),
        GoRoute(path: '/5b', builder: (context, state) => const Exo5bScreen()),
        GoRoute(path: '/5c', builder: (context, state) => const Exo5cScreen()),
      ]),
    );
  }
}
