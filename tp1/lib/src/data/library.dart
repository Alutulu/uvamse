// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'author.dart';
import 'media.dart';

final libraryInstance = Library()
  ..addMedia(
    title: 'Left Hand of Darkness',
    authorName: 'Ursula K. Le Guin',
    // isPopular: true,
    // isNew: true)
  )
  ..addMedia(
    title: 'Too Like the Lightning',
    authorName: 'Ada Palmer',
    // isPopular: false,
    // isNew: true)
  )
  ..addMedia(
    title: 'Kindred',
    authorName: 'Octavia E. Butler',
    // isPopular: true,
    // isNew: false)
  )
  ..addMedia(
    title: 'The Lathe of Heaven',
    authorName: 'Ursula K. Le Guin',
    // isPopular: false,
    // isNew: false);
  );

class Library {
  final List<Media> allMedias = [];
  final List<Author> allAuthors = [];

  void addMedia({
    required String title,
    required String authorName,
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
    var media = Media(allMedias.length, title, author);

    author.medias.add(media);
    allMedias.add(media);
  }

  Media getBook(String id) {
    return allMedias[int.parse(id)];
  }

  // List<Media> get popularBooks => [
  //       ...allMedias.where((media) => media.isPopular),
  //     ];

  // List<Book> get newBooks => [
  //       ...allMedias.where((book) => book.isNew),
  //     ];
}
