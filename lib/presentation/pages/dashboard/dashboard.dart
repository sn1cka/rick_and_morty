import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/router/app_router.gr.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      homeIndex: 0,
      routes: const [
        CharactersRoute(),
        EpisodesRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          enableFeedback: true,
          onTap: (index) => tabsRouter.setActiveIndex(index),
          currentIndex: tabsRouter.activeIndex,
          items: const [
            BottomNavigationBarItem(
                label: 'Heroes', //todo provide loc
                icon: Icon(Icons.abc)),
            BottomNavigationBarItem(
                label: 'Episodes', //todo provide loc
                icon: Icon(Icons.abc_outlined)),
          ],
        );
      },
    );
  }
}
