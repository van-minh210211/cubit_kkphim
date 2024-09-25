import 'package:apinew/model/Listphimle/data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'Listdata.g.dart';
@JsonSerializable()
class Listdata {
  String? status;
  String? msg;
  Data? data;
  Listdata({this.status, this.msg, this.data});

  factory Listdata.fromJson(Map<String, dynamic> json) =>
      _$ListdataFromJson(json);

  Map<String, dynamic> toJson() => _$ListdataToJson(this);

}