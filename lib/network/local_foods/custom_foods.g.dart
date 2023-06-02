// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_foods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomFood _$CustomFoodFromJson(Map<String, dynamic> json) => CustomFood(
      title: json['title'] as String,
      description: json['description'] as String,
      totalTime: json['totalTime'] as int,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$CustomFoodToJson(CustomFood instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'totalTime': instance.totalTime,
      'imageUrl': instance.imageUrl,
    };
