// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class MediasScreen extends StatefulWidget {
  final Widget child;
  final ValueChanged<int> onTap;
  final int selectedIndex;

  const MediasScreen({
    required this.child,
    required this.onTap,
    required this.selectedIndex,
    super.key,
  });

  @override
  State<MediasScreen> createState() => _MediasScreenState();
}

class _MediasScreenState extends State<MediasScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this)
      ..addListener(_handleTabIndexChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndexChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.index = widget.selectedIndex;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medias'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'All',
              icon: Icon(Icons.list),
            ),
            Tab(
              text: 'Films',
              icon: Icon(Icons.list),
            ),
            Tab(
              text: 'BDs',
              icon: Icon(Icons.list),
            ),
            Tab(
              text: 'Séries',
              icon: Icon(Icons.list),
            ),
            Tab(
              text: 'Livres',
              icon: Icon(Icons.list),
            ),
            Tab(
              text: 'Favoris',
              icon: Icon(Icons.favorite),
            ),
          ],
        ),
      ),
      body: widget.child,
    );
  }

  void _handleTabIndexChanged() {
    widget.onTap(_tabController.index);
  }
}
