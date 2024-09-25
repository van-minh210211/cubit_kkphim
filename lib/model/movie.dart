
import 'package:apinew/model/category.dart';
import 'package:apinew/model/created.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
 class Movie {
  Created? created;
  Created? modified;
  String? id;
  String? name;
  String? slug;
  String? origin_name;
  String? content;
  String? type;
  String? status;
  String? poster_url;
  String? thumb_url;
  bool? is_copyright;
  bool? sub_docquyen;
  bool? chieurap;
  String? trailer_url;
  String? time;
  String? episode_current;
  String? episode_total;
  String? quality;
  String? lang;
  String? notify;
  String? showtimes;
  int? year;
  int? view;
  List<String>? actor;
  List<String>? director;
  List<Category>? category;
  List<Category>? country;
  Movie(
      {this.created,
      this.modified,
      this.id,
      this.name,
      this.slug,
      this.origin_name,
      this.content,
      this.type,
      this.status,
      this.poster_url,
      this.thumb_url,
      this.is_copyright,
      this.sub_docquyen,
      this.chieurap,
      this.trailer_url,
      this.time,
      this.episode_current,
      this.episode_total,
      this.quality,
      this.lang,
      this.notify,
      this.showtimes,
      this.year,
      this.view,
      this.actor,
      this.director,
      this.category,
      this.country});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

