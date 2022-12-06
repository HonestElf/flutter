// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class GameItem {
  final int id;
  final String image;
  final String name;

  GameItem({required this.id, required this.image, required this.name});

  factory GameItem.formJson(Map<String, dynamic> json) =>
      _$GameItemFromJson(json);

  Map<String, dynamic> toJson() => _$GameItemToJson(this);
}
