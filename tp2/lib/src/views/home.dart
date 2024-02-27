// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp2/src/class/exercice.dart';
import 'package:tp2/src/class/tileGrid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  child: listExercices[index].toListTile(context));
            },
          ),
        ),
      );
}
