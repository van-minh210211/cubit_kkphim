import 'package:apinew/model/mod_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'items.g.dart';

@JsonSerializable()
class Items {
  Mod? modified;
  String? id;
  String? name;
  String? slug;
  String? origin_name;
  String? time;
  String? poster_url;
  String? thumb_url;
  int? year;

  Items({
    this.modified,
    this.id,
    this.name,
    this.slug,
    this.origin_name,
    this.poster_url,
    this.thumb_url,
    this.year,
    this.time,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
