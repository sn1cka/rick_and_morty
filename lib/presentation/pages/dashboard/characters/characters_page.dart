import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/locator/get_it.dart';
import 'package:rick_and_morty/core/router/app_router.gr.dart';
import 'package:rick_and_morty/presentation/pages/dashboard/characters/characters_cubit.dart';

class CharactersPage extends StatelessWidget {
  CharactersPage({Key? key}) : super(key: key);

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CharactersCubit>()..getCharacters(),
      child: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) => state is CharactersUpdated
            ? ListView(
                controller: _scrollController
                  ..addListener(() {
                    if (_scrollController.position.atEdge) {
                      bool isBottom = _scrollController.position.pixels != 0;
                      if (isBottom) {
                        BlocProvider.of<CharactersCubit>(context)
                            .getCharacters();
                      }
                    }
                  }),
                children: state.characters
                    .map((e) => InkWell(
                          onTap: () =>
                              context.pushRoute(CharacterRoute(character: e)),
                          child: Hero(
                              tag: e.id,
                              child: CachedNetworkImage(imageUrl: e.image)),
                        ))
                    .toList())
            : const CircularProgressIndicator(),
      ),
    );
  }
}
