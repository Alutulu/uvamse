// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp2/src/class/exercice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: listExercices.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  clipBehavior: Clip.hardEdge,
                  child: listExercices[index].toListTile());
            },
          ),

          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     ElevatedButton(
          //         onPressed: () {
          //           GoRouter.of(context).go('/2');
          //         },
          //         child: Text(
          //           "Vers le slider",
          //           style: Theme.of(context).textTheme.bodyLarge,
          //         )),
          //     const SizedBox(height: 30),
          //     ElevatedButton(
          //         onPressed: () {
          //           GoRouter.of(context).go('/media/favoris');
          //         },
          //         child: Text("Mes favoris",
          //             style: Theme.of(context).textTheme.bodyLarge)),
          //     const SizedBox(height: 30),
          //     ElevatedButton(
          //         onPressed: () {
          //           GoRouter.of(context).go('/authors');
          //         },
          //         child: Text("Tous les auteurs",
          //             style: Theme.of(context).textTheme.bodyLarge))
          //   ],
          // ),
        ),
      );
}
