import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/presentation/pages/dashboard/dashboard.dart';
import 'package:rick_and_morty/presentation/pages/dashboard/episodes_page.dart';
import 'package:rick_and_morty/presentation/pages/dashboard/characters/characters_page.dart';
import 'package:rick_and_morty/presentation/pages/character_page.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: DashBoardPage,
      initial: true,
      children: [
        AutoRoute(page: CharactersPage),
        AutoRoute(page: EpisodesPage),
      ],
    ),
    AutoRoute(page: CharacterPage, path: 'character'),
  ],
)
class $AppRouter {}
