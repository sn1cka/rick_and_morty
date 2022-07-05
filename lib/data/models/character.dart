import 'package:json_annotation/json_annotation.dart';

import 'location.dart';

part 'character.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocationModel origin;
  final LocationModel location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
