// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Application développée dans le cadre de l'UV AMSE à l'IMT Nord Europe.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Text(
                "Par Arthur Mata et Thibault Roux :)",
              ),
            ],
          ),
        ),
      );
}
