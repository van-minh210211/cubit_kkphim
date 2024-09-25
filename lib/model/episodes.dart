import 'package:json_annotation/json_annotation.dart';

import 'serverData.dart';
part 'episodes.g.dart';
@JsonSerializable()
class Episodes {
  String? server_name;
  List<ServerData>? server_data;

  Episodes({this.server_name, this.server_data});
  factory Episodes.fromJson(Map<String, dynamic> json) => _$EpisodesFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodesToJson(this);
}