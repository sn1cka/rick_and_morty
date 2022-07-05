import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty/data/models/info.dart';

part 'response_model.g.dart';

@JsonSerializable(
  createToJson: true,
  createFactory: true,
  genericArgumentFactories: true,
)
class ResponseModel<T> {
  ResponseModel(this.results, this.info);

  final List<T> results;

  final InfoModel info;

  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ResponseModelToJson(this, toJsonT);
}
