// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serverData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerData _$ServerDataFromJson(Map<String, dynamic> json) => ServerData(
      json['name'] as String,
      json['slug'] as String,
      json['filename'] as String,
      json['link_embed'] as String,
      json['link_m3u8'] as String,
    );

Map<String, dynamic> _$ServerDataToJson(ServerData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'filename': instance.filename,
      'link_embed': instance.link_embed,
      'link_m3u8': instance.link_m3u8,
    };
