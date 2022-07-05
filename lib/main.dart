import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_and_morty/core/locator/get_it.dart';
import 'package:rick_and_morty/core/router/app_router.gr.dart';

void main() {

  configureDependencies(Environment.prod);
  runApp(RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  RickAndMortyApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
