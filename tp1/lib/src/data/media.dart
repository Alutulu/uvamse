// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:bookstore/src/data/mediaType.dart';
import 'author.dart';

class Media {
  final int id;
  final String title;
  final Author author;
  final MediaType type;
  bool isFavoris;

  Media(this.id, this.title, this.author, this.type, this.isFavoris);

  getTypeString() {
    if (this.type == MediaType.BD) {
      return "BD";
    }
    if (this.type == MediaType.film) {
      return "Film";
    }
    if (this.type == MediaType.livre) {
      return "Livre";
    }
    if (this.type == MediaType.serie) {
      return "Série";
    }
  }
}
