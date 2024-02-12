// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:bookstore/src/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// import 'auth.dart';
import 'data.dart';
import 'screens/author_details.dart';
import 'screens/authors.dart';
import 'screens/media_details.dart';
import 'screens/medias.dart';
import 'screens/scaffold.dart';
import 'screens/about.dart';
import 'widgets/media_list.dart';
import 'widgets/fade_transition_page.dart';

final appShellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'app shell');
final mediasNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'medias shell');

class Mediastore extends StatefulWidget {
  const Mediastore({super.key});

  @override
  State<Mediastore> createState() => _MediastoreState();
}

class _MediastoreState extends State<Mediastore> {
  // final MediastoreAuth auth = MediastoreAuth();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        debugLogDiagnostics: true,
        initialLocation: '/home',
        routes: [
          ShellRoute(
            navigatorKey: appShellNavigatorKey,
            builder: (context, state, child) {
              return MediastoreScaffold(
                selectedIndex: switch (state.uri.path) {
                  var p when p.startsWith('/home') => 0,
                  var p when p.startsWith('/media') => 1,
                  var p when p.startsWith('/authors') => 2,
                  var p when p.startsWith('/about') => 3,
                  _ => 0,
                },
                child: child,
              );
            },
            routes: [
              GoRoute(
                  path: '/home',
                  pageBuilder: (context, state) {
                    return FadeTransitionPage<dynamic>(
                        key: state.pageKey, child: const HomeScreen());
                  }),
              ShellRoute(
                pageBuilder: (context, state, child) {
                  return FadeTransitionPage<dynamic>(
                    key: state.pageKey,
                    // Use a builder to get the correct BuildContext
                    child: Builder(builder: (context) {
                      return MediasScreen(
                        onTap: (idx) {
                          GoRouter.of(context).go(switch (idx) {
                            0 => '/media/all',
                            1 => '/media/favoris',
                            _ => '/media/all',
                          });
                        },
                        selectedIndex: switch (state.uri.path) {
                          var p when p.startsWith('/media/all') => 0,
                          var p when p.startsWith('/media/favoris') => 1,
                          _ => 0,
                        },
                        child: child,
                      );
                    }),
                  );
                },
                routes: [
                  GoRoute(
                    path: '/media/all',
                    pageBuilder: (context, state) {
                      return FadeTransitionPage<dynamic>(
                        key: state.pageKey,
                        // Use a builder to get the correct BuildContext
                        child: Builder(
                          builder: (context) {
                            return MediaList(
                              medias: libraryInstance.allMedias,
                              onTap: (media) {
                                GoRouter.of(context)
                                    .go('/media/all/media/${media.id}');
                              },
                            );
                          },
                        ),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'media/:mediaId',
                        parentNavigatorKey: appShellNavigatorKey,
                        builder: (context, state) {
                          return MediaDetailsScreen(
                            media: libraryInstance.getMedia(
                                state.pathParameters['mediaId'] ?? ''),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: '/media/favoris',
                    pageBuilder: (context, state) {
                      return FadeTransitionPage<dynamic>(
                        // Use a builder to get the correct BuildContext
                        key: state.pageKey,
                        child: Builder(
                          builder: (context) {
                            return MediaList(
                              medias: libraryInstance.favoriteMedias,
                              onTap: (media) {
                                GoRouter.of(context)
                                    .go('/media/favoris/media/${media.id}');
                              },
                            );
                          },
                        ),
                      );
                    },
                    routes: [
                      GoRoute(
                        path: 'media/:mediaId',
                        parentNavigatorKey: appShellNavigatorKey,
                        builder: (context, state) {
                          return MediaDetailsScreen(
                            media: libraryInstance.getMedia(
                                state.pathParameters['mediaId'] ?? ''),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: '/authors',
                pageBuilder: (context, state) {
                  return FadeTransitionPage<dynamic>(
                    key: state.pageKey,
                    child: Builder(builder: (context) {
                      return AuthorsScreen(
                        onTap: (author) {
                          GoRouter.of(context)
                              .go('/authors/author/${author.id}');
                        },
                      );
                    }),
                  );
                },
                routes: [
                  GoRoute(
                    path: 'author/:authorId',
                    builder: (context, state) {
                      final author = libraryInstance.allAuthors.firstWhere(
                          (author) =>
                              author.id ==
                              int.parse(state.pathParameters['authorId']!));
                      // Use a builder to get the correct BuildContext
                      return Builder(builder: (context) {
                        return AuthorDetailsScreen(
                          author: author,
                          onMediaTapped: (media) {
                            GoRouter.of(context)
                                .go('/media/all/media/${media.id}');
                          },
                        );
                      });
                    },
                  )
                ],
              ),
              GoRoute(
                path: '/about',
                pageBuilder: (context, state) {
                  return FadeTransitionPage<dynamic>(
                    key: state.pageKey,
                    child: const AboutScreen(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
