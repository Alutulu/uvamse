// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/media/all');
                  },
                  child: Text(
                    "Tous les médias",
                    style: Theme.of(context).textTheme.bodyLarge,
                  )),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/media/favoris');
                  },
                  child: Text("Mes favoris",
                      style: Theme.of(context).textTheme.bodyLarge)),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/authors');
                  },
                  child: Text("Tous les auteurs",
                      style: Theme.of(context).textTheme.bodyLarge))
            ],
          ),
        ),
      );
}
