// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'author.dart';

class Media {
  final int id;
  final String title;
  final Author author;
  bool isFavoris;
  // final bool isPopular;
  // final bool isNew;

  Media(this.id, this.title, this.author, this.isFavoris);
}
