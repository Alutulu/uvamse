// Copyright 2021, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'auth.dart';
import 'data.dart';
import 'screens/author_details.dart';
import 'screens/authors.dart';
import 'screens/media_details.dart';
import 'screens/medias.dart';
import 'screens/scaffold.dart';
import 'screens/settings.dart';
import 'screens/sign_in.dart';
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
  final MediastoreAuth auth = MediastoreAuth();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        if (child == null) {
          throw ('No child in .router constructor builder');
        }
        return MediastoreAuthScope(
          notifier: auth,
          child: child,
        );
      },
      routerConfig: GoRouter(
        refreshListenable: auth,
        debugLogDiagnostics: true,
        initialLocation: '/home/all',
        redirect: (context, state) {
          final signedIn = MediastoreAuth.of(context).signedIn;
          if (state.uri.toString() != '/sign-in' && !signedIn) {
            return '/sign-in';
          }
          return null;
        },
        routes: [
          ShellRoute(
            navigatorKey: appShellNavigatorKey,
            builder: (context, state, child) {
              return MediastoreScaffold(
                selectedIndex: switch (state.uri.path) {
                  var p when p.startsWith('/home') => 0,
                  var p when p.startsWith('/authors') => 1,
                  var p when p.startsWith('/settings') => 2,
                  _ => 0,
                },
                child: child,
              );
            },
            routes: [
              ShellRoute(
                pageBuilder: (context, state, child) {
                  return FadeTransitionPage<dynamic>(
                    key: state.pageKey,
                    // Use a builder to get the correct BuildContext
                    child: Builder(builder: (context) {
                      return MediasScreen(
                        onTap: (idx) {
                          GoRouter.of(context).go(switch (idx) {
                            0 => '/home/all',
                            1 => '/home/favoris',
                            // 2 => '/home/all',
                            _ => '/home/all',
                          });
                        },
                        selectedIndex: switch (state.uri.path) {
                          var p when p.startsWith('/home/all') => 0,
                          var p when p.startsWith('/home/favoris') => 1,
                          // var p when p.startsWith('/home/all') => 2,
                          _ => 0,
                        },
                        child: child,
                      );
                    }),
                  );
                },
                routes: [
                  GoRoute(
                    path: '/home/all',
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
                                    .go('/home/all/media/${media.id}');
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
                    path: '/home/favoris',
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
                                    .go('/home/favoris/media/${media.id}');
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
                          onBookTapped: (media) {
                            GoRouter.of(context)
                                .go('/home/all/media/${media.id}');
                          },
                        );
                      });
                    },
                  )
                ],
              ),
              GoRoute(
                path: '/settings',
                pageBuilder: (context, state) {
                  return FadeTransitionPage<dynamic>(
                    key: state.pageKey,
                    child: const SettingsScreen(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: '/sign-in',
            builder: (context, state) {
              // Use a builder to get the correct BuildContext
              return Builder(
                builder: (context) {
                  return SignInScreen(
                    onSignIn: (value) async {
                      final router = GoRouter.of(context);
                      await MediastoreAuth.of(context)
                          .signIn(value.username, value.password);
                      router.go('/home/all');
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
