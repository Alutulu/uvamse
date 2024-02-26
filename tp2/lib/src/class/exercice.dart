import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<Exercice> listExercices = [
  Exercice(
      description: "Exercice avec un slider pour transformer une image",
      title: "2) Slider",
      path: "/2"),
  Exercice(
      description: "Page qui affiche une tuile de Taquin",
      title: "4) Affichage d'une tuile",
      path: "/4"),
  Exercice(
      description: "Page qui affiche des tuiles",
      title: "5A) Grille de tuiles",
      path: "/5a"),
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
