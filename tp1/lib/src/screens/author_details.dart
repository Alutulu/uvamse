// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../data.dart';
import '../widgets/media_list.dart';

class AuthorDetailsScreen extends StatelessWidget {
  final Author author;
  final ValueChanged<Media> onMediaTapped;

  const AuthorDetailsScreen({
    super.key,
    required this.author,
    required this.onMediaTapped,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(author.name),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: MediaList(
                  medias: author.medias,
                  onTap: (media) {
                    onMediaTapped(media);
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
