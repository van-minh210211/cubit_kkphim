// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      modified: json['modified'] == null
          ? null
          : Mod.fromJson(json['modified'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      origin_name: json['origin_name'] as String?,
      poster_url: json['poster_url'] as String?,
      thumb_url: json['thumb_url'] as String?,
      year: (json['year'] as num?)?.toInt(),
      time: json['time'] as String?,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'modified': instance.modified,
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'origin_name': instance.origin_name,
      'time': instance.time,
      'poster_url': instance.poster_url,
      'thumb_url': instance.thumb_url,
      'year': instance.year,
    };
