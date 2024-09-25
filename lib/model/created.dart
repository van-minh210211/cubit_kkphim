
import 'package:json_annotation/json_annotation.dart';
part 'created.g.dart';
@JsonSerializable()
class Created {
  String? time;
  Created ({this.time});
  factory Created.fromJson(Map<String, dynamic> json) => _$CreatedFromJson(json);

  Map<String, dynamic> toJson() => _$CreatedToJson(this);

}