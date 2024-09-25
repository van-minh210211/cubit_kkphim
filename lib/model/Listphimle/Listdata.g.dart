// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Listdata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Listdata _$ListdataFromJson(Map<String, dynamic> json) => Listdata(
      status: json['status'] as String?,
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListdataToJson(Listdata instance) => <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };
