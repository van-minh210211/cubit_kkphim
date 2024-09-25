import 'dart:convert';
import 'package:apinew/model/episodes.dart';
import 'package:apinew/model/movie.dart';
import 'package:json_annotation/json_annotation.dart';
part 'detail.g.dart';
@JsonSerializable()
class Detail {
   bool? status;
   String? msg;
   Movie? movie;
   List<Episodes>? episodes;
   Detail ({
     this.status, this.msg, this.movie, this.episodes
});
   factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

   Map<String, dynamic> toJson() => _$DetailToJson(this);
}

