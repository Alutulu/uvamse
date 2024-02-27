import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BoutonRetour {
  static Widget widget(BuildContext context) => ElevatedButton(
      onPressed: () {
        GoRouter.of(context).go('/');
      },
      child: Text(
        "Retour",
        style: Theme.of(context).textTheme.bodyLarge,
      ));
}
