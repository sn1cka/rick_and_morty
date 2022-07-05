import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';


@JsonSerializable(createToJson: true, createFactory: true)
class EpisodeModel {
  EpisodeModel({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final String airDate;
  final String episode;
  final List<String> characters;
  final String url;
  final DateTime created;


  factory EpisodeModel.fromJson(Map<String, dynamic> json) => _$EpisodeModelFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeModelToJson(this);
}
