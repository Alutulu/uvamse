import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<Exercice> listExercices = [
  Exercice(
      description: "Exercice avec un slider", title: "2) Slider", path: "/2"),
];

class Exercice {
  final String title;
  final String path;
  final String description;

  Exercice(
      {required this.title, required this.description, required this.path});

  ListTile toListTile(BuildContext context) => ListTile(
        title: Text(title),
        tileColor: Colors.teal[100],
        subtitle: Text(description),
        onTap: () {
          GoRouter.of(context).go(path);
        },
      );
}
