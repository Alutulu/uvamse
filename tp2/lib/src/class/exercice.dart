import 'package:flutter/material.dart';

List<Exercice> listExercices = [
  Exercice(description: "coucou c'est moi", title: "Moumou", path: "labas")
];

class Exercice {
  final String title;
  final String path;
  final String description;

  Exercice(
      {required this.title, required this.description, required this.path});

  ListTile toListTile() => ListTile(
        title: Text(title),
        tileColor: Colors.teal[100],
        subtitle: Text(description),
      );
}
