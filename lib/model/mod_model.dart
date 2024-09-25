import 'package:json_annotation/json_annotation.dart';

part 'mod_model.g.dart';

@JsonSerializable()
class Mod {
  String? time;
  Mod({this.time});
  factory Mod.fromJson(Map<String, dynamic> json) => _$ModFromJson(json);
  Map<String, dynamic> toJson() => _$ModToJson(this);
}
