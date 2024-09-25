import 'dart:convert';

import 'package:apinew/model/Listphimle/items.dart';
import 'package:apinew/model/detail.dart';
import 'package:apinew/model/episodes.dart';
import 'package:apinew/model/home_page.dart';
import 'package:apinew/model/item_model.dart';
import 'package:dio/dio.dart';

import '../model/movie.dart';

class Data {
  const Data(this.dio);
  final Dio dio;
  Future<List<Item>> getdata() async {
    try {
      var respon = await dio
          .get("https://phimapi.com/danh-sach/phim-moi-cap-nhat?page=1");
      final json = respon.data["items"];
      var data = List<Item>.from(json.map((x) => Item.fromJson(x)));
      return data;
    } catch (e) {
      return [];
    }
  }

  Future<Detail> getdDetail (String slug) async{

    var getdetail = await dio.get("https://phimapi.com/phim/$slug");

      if (getdetail.statusCode == 200) {
        final jsonResponse = getdetail.data;
        return Detail.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load movie');
      }
}
  Future<List<Items>> phimele() async {
    try {
      var respon = await dio.get("https://phimapi.com/v1/api/danh-sach/phim-le");
      final json = respon.data["data"]["items"]; // Lấy dữ liệu từ key 'data'
      var data = List<Items>.from(json.map((x) => Items.fromJson(x)));
      return data;
    } catch (e) {
      return [];
    }
  }
  Future<List<Items>> phimebo() async {
    try {
      var respon = await dio.get("https://phimapi.com/v1/api/danh-sach/phim-bo");
      final json = respon.data["data"]["items"]; // Lấy dữ liệu từ key 'data'
      var data = List<Items>.from(json.map((x) => Items.fromJson(x)));
      return data;
    } catch (e) {
      return [];
    }
  }
  Future<List<Items>> hoathinh() async {
    try {
      var respon = await dio.get("https://phimapi.com/v1/api/danh-sach/hoat-hinh");
      final json = respon.data["data"]["items"]; // Lấy dữ liệu từ key 'data'
      var data = List<Items>.from(json.map((x) => Items.fromJson(x)));
      return data;
    } catch (e) {
      return [];
    }
  }
  Future<List<Items>> TVshow() async {
    try {
      var respon = await dio.get("https://phimapi.com/v1/api/danh-sach/tv-shows");
      final json = respon.data["data"]["items"]; // Lấy dữ liệu từ key 'data'
      var data = List<Items>.from(json.map((x) => Items.fromJson(x)));
      return data;
    } catch (e) {
      return [];
    }
  }
  Future<List<Items>> Search( String key) async {
    try {
      var respon = await dio.get("https://phimapi.com/v1/api/tim-kiem?keyword=$key&limit=3");
      final json = respon.data["data"]["items"]; // Lấy dữ liệu từ key 'data'
      var data = List<Items>.from(json.map((x) => Items.fromJson(x)));
      return data;
    } catch (e) {
      return [];
    }
  }
}
