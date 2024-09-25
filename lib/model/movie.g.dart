// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      created: json['created'] == null
          ? null
          : Created.fromJson(json['created'] as Map<String, dynamic>),
      modified: json['modified'] == null
          ? null
          : Created.fromJson(json['modified'] as Map<String, dynamic>),
      id: json['id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      origin_name: json['origin_name'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      poster_url: json['poster_url'] as String?,
      thumb_url: json['thumb_url'] as String?,
      is_copyright: json['is_copyright'] as bool?,
      sub_docquyen: json['sub_docquyen'] as bool?,
      chieurap: json['chieurap'] as bool?,
      trailer_url: json['trailer_url'] as String?,
      time: json['time'] as String?,
      episode_current: json['episode_current'] as String?,
      episode_total: json['episode_total'] as String?,
      quality: json['quality'] as String?,
      lang: json['lang'] as String?,
      notify: json['notify'] as String?,
      showtimes: json['showtimes'] as String?,
      year: (json['year'] as num?)?.toInt(),
      view: (json['view'] as num?)?.toInt(),
      actor:
          (json['actor'] as List<dynamic>?)?.map((e) => e as String).toList(),
      director: (json['director'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      country: (json['country'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'created': instance.created,
      'modified': instance.modified,
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'origin_name': instance.origin_name,
      'content': instance.content,
      'type': instance.type,
      'status': instance.status,
      'poster_url': instance.poster_url,
      'thumb_url': instance.thumb_url,
      'is_copyright': instance.is_copyright,
      'sub_docquyen': instance.sub_docquyen,
      'chieurap': instance.chieurap,
      'trailer_url': instance.trailer_url,
      'time': instance.time,
      'episode_current': instance.episode_current,
      'episode_total': instance.episode_total,
      'quality': instance.quality,
      'lang': instance.lang,
      'notify': instance.notify,
      'showtimes': instance.showtimes,
      'year': instance.year,
      'view': instance.view,
      'actor': instance.actor,
      'director': instance.director,
      'category': instance.category,
      'country': instance.country,
    };
