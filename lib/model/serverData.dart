
import 'package:json_annotation/json_annotation.dart';
part 'serverData.g.dart';
@JsonSerializable()
class ServerData{
  String name;
  String slug;
  String filename;
  String link_embed;
  String link_m3u8;
  ServerData( this.name, this.slug, this.filename, this.link_embed, this.link_m3u8);
  factory ServerData.fromJson(Map<String, dynamic> json) => _$ServerDataFromJson(json);

  Map<String, dynamic> toJson() => _$ServerDataToJson(this);

}