import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/character.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Hero(
                tag: character.id,
                child: CachedNetworkImage(
                  imageUrl: character.image,
                )),
          ),
        ],
      ),
    );
  }
}
