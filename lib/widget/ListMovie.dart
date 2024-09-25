import 'package:apinew/bloc/home_cubit.dart';
import 'package:apinew/bloc/video_cubit.dart';
import 'package:apinew/model/detail.dart';

import 'package:apinew/ui/Detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Listmovie extends StatelessWidget {
  const Listmovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return SizedBox(
            height: 280,
            child: ListView.builder(
                itemCount: state.ListPage.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      try {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    url: state.ListPage[index].slug)));
                      } catch (e) {}
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageUrl: state.ListPage[index].poster_url ?? "",
                          // width: double.infinity,
                          height: 236,
                        ),
                        Text(state.ListPage[index].name??""),
                        Text(state.ListPage[index].origin_name??"")
                      ],
                    ),
                  );
                }),
          );
        }
        return Container();
      },
    );
  }
}
