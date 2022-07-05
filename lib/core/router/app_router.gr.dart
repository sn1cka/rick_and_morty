// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../domain/entities/character.dart' as _i7;
import '../../presentation/pages/character_page.dart' as _i2;
import '../../presentation/pages/dashboard/characters/characters_page.dart'
    as _i3;
import '../../presentation/pages/dashboard/dashboard.dart' as _i1;
import '../../presentation/pages/dashboard/episodes_page.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DashBoardRoute.name: (routeData) {
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.DashBoardPage());
    },
    CharacterRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterRouteArgs>();
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i2.CharacterPage(key: args.key, character: args.character));
    },
    CharactersRoute.name: (routeData) {
      final args = routeData.argsAs<CharactersRouteArgs>(
          orElse: () => const CharactersRouteArgs());
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData, child: _i3.CharactersPage(key: args.key));
    },
    EpisodesRoute.name: (routeData) {
      return _i5.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.EpisodesPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(DashBoardRoute.name, path: '/', children: [
          _i5.RouteConfig(CharactersRoute.name,
              path: 'characters-page', parent: DashBoardRoute.name),
          _i5.RouteConfig(EpisodesRoute.name,
              path: 'episodes-page', parent: DashBoardRoute.name)
        ]),
        _i5.RouteConfig(CharacterRoute.name, path: 'character')
      ];
}

/// generated route for
/// [_i1.DashBoardPage]
class DashBoardRoute extends _i5.PageRouteInfo<void> {
  const DashBoardRoute({List<_i5.PageRouteInfo>? children})
      : super(DashBoardRoute.name, path: '/', initialChildren: children);

  static const String name = 'DashBoardRoute';
}

/// generated route for
/// [_i2.CharacterPage]
class CharacterRoute extends _i5.PageRouteInfo<CharacterRouteArgs> {
  CharacterRoute({_i6.Key? key, required _i7.Character character})
      : super(CharacterRoute.name,
            path: 'character',
            args: CharacterRouteArgs(key: key, character: character));

  static const String name = 'CharacterRoute';
}

class CharacterRouteArgs {
  const CharacterRouteArgs({this.key, required this.character});

  final _i6.Key? key;

  final _i7.Character character;

  @override
  String toString() {
    return 'CharacterRouteArgs{key: $key, character: $character}';
  }
}

/// generated route for
/// [_i3.CharactersPage]
class CharactersRoute extends _i5.PageRouteInfo<CharactersRouteArgs> {
  CharactersRoute({_i6.Key? key})
      : super(CharactersRoute.name,
            path: 'characters-page', args: CharactersRouteArgs(key: key));

  static const String name = 'CharactersRoute';
}

class CharactersRouteArgs {
  const CharactersRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'CharactersRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.EpisodesPage]
class EpisodesRoute extends _i5.PageRouteInfo<void> {
  const EpisodesRoute() : super(EpisodesRoute.name, path: 'episodes-page');

  static const String name = 'EpisodesRoute';
}
