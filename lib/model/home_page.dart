import 'package:apinew/model/item_model.dart';
import 'package:apinew/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'home_page.g.dart';

@JsonSerializable()
class Mun {
  final bool? status;
  final List<Item>? items;
  final Pagination? pagination;
  Mun(this.status, this.items, this.pagination);
  factory Mun.fromJson(Map<String, dynamic> json) => _$MunFromJson(json);
  Map<String, dynamic> toJson() => _$MunToJson(this);
}
