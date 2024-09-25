// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mun _$MunFromJson(Map<String, dynamic> json) => Mun(
      json['status'] as bool?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MunToJson(Mun instance) => <String, dynamic>{
      'status': instance.status,
      'items': instance.items,
      'pagination': instance.pagination,
    };
