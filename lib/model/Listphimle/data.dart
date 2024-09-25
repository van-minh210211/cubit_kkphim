import 'package:apinew/model/Listphimle/items.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';
@JsonSerializable()
class Data {
  String titlePage;
  List<Items>? items;
  Data ({required this.items,required this.titlePage});
  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}