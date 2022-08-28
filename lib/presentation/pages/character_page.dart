import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/character.dart';
import 'package:rick_and_morty/presentation/widgets/gyro_card.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Card'),
      ),
      body: GyroRotatedCard(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.grey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                  imageUrl: character.image,
                ),
                const Text('asdn'),
                const Text('asdn'),
                const Text('asdn'),
                const Text('asdn'),
                const Text('asdn'),
                const Text('asdn'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
