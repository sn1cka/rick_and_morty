import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable(
  createFactory: true,
  createToJson: true,
)
class LocationModel {
  LocationModel({
    this.id,
   this.name,
   this.type,
   this.dimension,
   this.residents,
   this.url,
   this.created,
  });

  final int? id;
  final String? name;
  final String? type;
  final String? dimension;
  final List<String>? residents;
  final String? url;
  final DateTime? created;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
