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
  Exercice(
      description: "Grille 3x3",
      title: "5B) Page qui affiche une grille 3x3",
      path: "/5b"),
  Exercice(
      description: "Division d'image avec un slider",
      title: "5C) Division d'image",
      path: "/5c"),
  Exercice(
      description: "Permutation de tuile",
      title: "6A Permutation de tuile",
      path: "/6"),
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
