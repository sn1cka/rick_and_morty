import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/character.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(16),
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                  errorWidget: (context, url, error) => const SizedBox(
                      height: 150,
                      width: 150,
                      child: Center(
                          child: Icon(
                        Icons.error_outline_sharp,
                        color: Colors.redAccent,
                      ))),
                  progressIndicatorBuilder: (context, url, progress) {
                    return const SizedBox(
                        height: 150,
                        width: 150,
                        child: Center(child: CircularProgressIndicator()));
                  },
                  height: 150,
                  imageUrl: character.image),
            ),
            Expanded(
                child: Text(
              character.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
