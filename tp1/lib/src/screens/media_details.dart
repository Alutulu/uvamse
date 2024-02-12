// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/link.dart';

import '../data.dart';
import 'author_details.dart';

class MediaDetailsScreen extends StatelessWidget {
  final Media? media;

  const MediaDetailsScreen({
    super.key,
    this.media,
  });

  @override
  Widget build(BuildContext context) {
    if (media == null) {
      return const Scaffold(
        body: Center(
          child: Text('No media found.'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(media!.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              media!.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              media!.author.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
              child: const Text('View author (Push)'),
              onPressed: () {
                Navigator.of(context).push<void>(
                  MaterialPageRoute<void>(
                    builder: (context) => AuthorDetailsScreen(
                      author: media!.author,
                      onBookTapped: (media) {
                        GoRouter.of(context).go('/home/all/media/${media.id}');
                      },
                    ),
                  ),
                );
              },
            ),
            Link(
              uri: Uri.parse('/authors/author/${media!.author.id}'),
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: const Text('View author (Link)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
