// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameItem _$GameItemFromJson(Map<String, dynamic> json) => GameItem(
      id: json['id'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$GameItemToJson(GameItem instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
    };
