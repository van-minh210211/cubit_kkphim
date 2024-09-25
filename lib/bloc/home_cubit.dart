import 'dart:math';

import 'package:apinew/api/api_listhome.dart';
import 'package:apinew/model/Listphimle/items.dart';
import 'package:apinew/model/detail.dart';
import 'package:apinew/model/episodes.dart';
import 'package:apinew/model/home_page.dart';
import 'package:apinew/model/item_model.dart';
import 'package:apinew/model/movie.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final Data _data;

  HomeCubit(this._data) : super(HomeInitial());

  Future data() async {
    try {
      final repondata = await _data.getdata();
      final datale = await _data.phimele();
      final databo = await _data.phimebo();
      final hoathinh = await _data.hoathinh();
      final tvshow = await _data.TVshow();
      emit(HomeLoaded(
          ListPage4: tvshow,
          ListPage: repondata,
          ListPage2: databo,
          ListPage1: datale,
          ListPage3: hoathinh));
    } catch (e) {}
  }

  Future datadetail(String slug) async {
    try {
      final repondata = await _data.getdDetail(slug);
      emit(HomeDetail(movie: repondata, datayou: []));
    } catch (e) {}
  }
}
