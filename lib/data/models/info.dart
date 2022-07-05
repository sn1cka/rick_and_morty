import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable(
  createToJson: true,
  createFactory: true,
)
class InfoModel {
  InfoModel(this.count, this.pages, this.next, this.prev);

  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoModelToJson(this);
}
