import 'package:apinew/api/api_listhome.dart';
import 'package:apinew/bloc/home_cubit.dart';
import 'package:apinew/widget/Hoathinh.dart';
import 'package:apinew/widget/ListMovie.dart';
import 'package:apinew/widget/Movi_phimbo.dart';
import 'package:apinew/widget/Movi_phimle.dart';
import 'package:apinew/widget/tvshow.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllMovie extends StatefulWidget {
  const AllMovie({super.key});

  @override
  State<AllMovie> createState() => _AllMovieState();
}

class _AllMovieState extends State<AllMovie> {
  late HomeCubit _ListHome;
  final url = Data(Dio());

  @override
  void initState() {
    _ListHome = HomeCubit(url);
    // TODO: implement initState
    _ListHome.data();

    super.initState();
  }

  int indexac = 0;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                    itemCount: state.ListPage.length,

                    itemBuilder: (context, index, relexindex) {

                      final imageindex = state.ListPage[index].poster_url??"";
                      final textindex = state.ListPage[relexindex].name??"";
                      return buildImage(imageindex, index, textindex);
                    },
                    options: CarouselOptions(
                        height: 250,
                        autoPlay: true,
                        enableInfiniteScroll: false,
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) =>
                            setState(() => null))),
                Text("Mới nhất"),
                Listmovie(),
                SizedBox(
                  height: 13,
                ),
                Text("Phim lẻ"),
                Listphimle(),
                SizedBox(
                  height: 13,
                ),
                Text("Hoạt Hình"),
                Hoathinh(),
                SizedBox(
                  height: 13,
                ),
                Text("Tv Show"),
                Tvshow(),
                SizedBox(
                  height: 13,
                ),
                Text("Phim Bộ"),
                Listphimbo(),
              ],
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

Widget buildImage(String urlImage, int index, String textindex) => Container(
      child: Column(
        children: [Image.network(urlImage, fit: BoxFit.cover), Text(textindex)],
      ),
    );
