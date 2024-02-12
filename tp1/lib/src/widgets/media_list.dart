// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data.dart';

class MediaList extends StatelessWidget {
  final List<Media> medias;
  final ValueChanged<Media>? onTap;


  const MediaList({
    required this.medias,
    this.onTap,

    super.key,
  });



  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: medias.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            medias[index].title,
          ),
          subtitle: Text(
            medias[index].author.name,
          ),
          onTap: onTap != null ? () => onTap!(medias[index]) : null,

          trailing: IconButton(
            key: Key(medias[index].title),
            icon: medias[index].isFavoris==true 
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
            onPressed :(){
             medias[index].isFavoris==true
            ? medias[index].isFavoris==false
            : medias[index].isFavoris==true; 
            }),

        ),
      );
}
