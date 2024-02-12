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
    type: MediaType.serie,
    isFavoris: false,
  )
  ..addMedia(
    title: 'Kindred',
    authorName: 'Octavia E. Butler',
    type: MediaType.serie,
    isFavoris: false,
  )
  ..addMedia(
      title: 'The Lathe of Heaven',
      authorName: 'Ursula K. Le Guin',
      type: MediaType.BD,
      isFavoris: false)
  ..addMedia(
    title: 'Hand of Darkness Left',
    authorName: 'Guin Lightning Le K.',
    type: MediaType.serie,
    isFavoris: false,
  )
  ..addMedia(
    title: 'Too Bad things',
    authorName: 'Ada Palmer',
    type: MediaType.film,
    isFavoris: false,
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
      isFavoris: false)
  ..addMedia(
    title: 'Le Seigneur des anneaux',
    authorName: 'Arthur Mata',
    type: MediaType.film,
    isFavoris: false,
  )
  ..addMedia(
    title: 'Harry Potter',
    authorName: 'Thibault Roux',
    type: MediaType.livre,
    isFavoris: false,
  )
  ..addMedia(
    title: 'Gogo gadgeto',
    authorName: 'Arthur Mata',
    type: MediaType.BD,
    isFavoris: false,
  )
  ..addMedia(
      title: 'The Platinium',
      authorName: 'Mr. Ourson',
      type: MediaType.serie,
      isFavoris: false)
  ..addMedia(
    title: 'The goldness',
    authorName: 'Thibault Roux',
    type: MediaType.serie,
    isFavoris: false,
  )
  ..addMedia(
    title: 'Are you mad ?',
    authorName: 'Momo Raoul',
    type: MediaType.film,
    isFavoris: false,
  );

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

  List<Media> get filmMedias => [
        ...allMedias.where((media) => media.type == MediaType.film),
      ];

  List<Media> get BDMedias => [
        ...allMedias.where((media) => media.type == MediaType.BD),
      ];

  List<Media> get serieMedias => [
        ...allMedias.where((media) => media.type == MediaType.serie),
      ];

  List<Media> get livreMedias => [
        ...allMedias.where((media) => media.type == MediaType.livre),
      ];

  // List<Book> get newBooks => [
  //       ...allMedias.where((book) => book.isNew),
  //     ];
}
