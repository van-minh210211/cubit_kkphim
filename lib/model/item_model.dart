import 'package:apinew/model/mod_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'item_model.g.dart';

@JsonSerializable()
class Item {
  Mod? modified;
  String? id;
  String? name;
  String? slug;
  String? origin_name;
  String? poster_url;
  String? thumb_url;
  int? year;

  Item({
    this.modified,
    this.id,
    this.name,
    this.slug,
    this.origin_name,
    this.poster_url,
    this.thumb_url,
    this.year
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
