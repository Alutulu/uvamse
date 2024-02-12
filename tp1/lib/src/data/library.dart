// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:bookstore/src/data/mediaType.dart';

import 'author.dart';
import 'media.dart';

final libraryInstance = Library()
  ..addMedia(
    title: 'Left Hand of Darkness',
    authorName: 'Ursula K. Le Guin',
    type: MediaType.film,
    isFavoris: false,
  )
  ..addMedia(
    title: 'Too Like the Lightning',
    authorName: 'Ada Palmer',
    type: MediaType.manga,
    isFavoris: true,
  )
  ..addMedia(
    title: 'Kindred',
    authorName: 'Octavia E. Butler',
    type: MediaType.manga,
    isFavoris: false,
  )
  ..addMedia(
      title: 'The Lathe of Heaven',
      authorName: 'Ursula K. Le Guin',
      type: MediaType.BD,
      isFavoris: true)
  ..addMedia(
    title: 'Hand of Darkness Left',
    authorName: 'Guin Lightning Le K.',
    type: MediaType.serie,
    isFavoris: true,
  )
  ..addMedia(
    title: 'Too Bad things',
    authorName: 'Ada Palmer',
    type: MediaType.film,
    isFavoris: true,
  )
  ..addMedia(
    title: 'Children',
    authorName: 'Octavia E. Butler',
    type: MediaType.film,
    isFavoris: false,
  )
  ..addMedia(
      title: 'The Heaven of Lathe',
      authorName: 'Octavia Lightning',
      type: MediaType.livre,
      isFavoris: true);

class Library {
  final List<Media> allMedias = [];
  final List<Author> allAuthors = [];

  void addMedia({
    required String title,
    required String authorName,
    required MediaType type,
    required bool isFavoris,
    // required bool isPopular,
    // required bool isNew,
  }) {
    var author = allAuthors.firstWhere(
      (author) => author.name == authorName,
      orElse: () {
        final value = Author(allAuthors.length, authorName);
        allAuthors.add(value);
        return value;
      },
    );
    var media = Media(allMedias.length, title, author, type, isFavoris);

    author.medias.add(media);
    allMedias.add(media);
  }

  Media getMedia(String id) {
    return allMedias[int.parse(id)];
  }

  // List<Media> get popularBooks => [
  //       ...allMedias.where((media) => media.isPopular),
  //     ];

  List<Media> get favoriteMedias => [
        ...allMedias.where((media) => media.isFavoris),
      ];

  // List<Book> get newBooks => [
  //       ...allMedias.where((book) => book.isNew),
  //     ];
}
