import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/locator/get_it.dart';
import 'package:rick_and_morty/core/router/app_router.gr.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/presentation/pages/dashboard/characters/characters_cubit.dart';
import 'package:rick_and_morty/presentation/widgets/character_tile.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CharactersCubit>()..updateCharactersList(),
      child: BlocListener<CharactersCubit, CharactersState>(
        listener: (BuildContext context, Object? state) {
          if (state is CharactersException) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.exception.toString())));
          }
          if (state is CharactersUpdated && state.isLastPortion) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('That\'s all folks!')));
          }
        },
        child: const _CharactersList(),
      ),
    );
  }
}

class _CharactersList extends StatefulWidget {
  const _CharactersList({Key? key}) : super(key: key);

  @override
  State<_CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<_CharactersList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var state = BlocProvider.of<CharactersCubit>(context).state;
      if (_scrollController.position.outOfRange &&
          _scrollController.position.pixels > 0 &&
          state is CharactersUpdated &&
          !state.isLastPortion) {
        BlocProvider.of<CharactersCubit>(context).updateCharactersList();
        HapticFeedback.heavyImpact();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollBehavior: const ScrollBehavior(),
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(),
        BlocBuilder<CharactersCubit, CharactersState>(
          buildWhen: (previous, current) => current is CharactersUpdated,
          builder: (context, state) {
            List<Character> chars =
                state is CharactersUpdated ? state.characters : [];
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                        onTap: () => context
                            .pushRoute(CharacterRoute(character: chars[index])),
                        child: CharacterTile(character: chars[index])),
                  );
                },
                childCount: chars.length,
              ),
            );
          },
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<CharactersCubit, CharactersState>(
            builder: (context, state) => AnimatedSize(
              duration: const Duration(milliseconds: 500),
              child: state is CharactersLoading
                  ? const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        )
      ],
    );
  }
}
