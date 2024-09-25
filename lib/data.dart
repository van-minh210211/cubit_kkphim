import 'package:apinew/bloc/home_cubit.dart';
import 'package:apinew/bloc/video_cubit.dart';

import 'package:apinew/ui/Detail.dart';
import 'package:apinew/widget/YouToBe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestData extends StatefulWidget {
  final Function(String) onEpisodeTap;
   TestData({required this.onEpisodeTap,super.key});

  @override
  State<TestData> createState() => _TestDataState();
}

class _TestDataState extends State<TestData> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeDetail) {
          return SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.movie.episodes?[0].server_data?.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    final url = state.movie.episodes?[0].server_data?[index].link_m3u8 ?? "";
                    if (url.isNotEmpty) {
                      widget.onEpisodeTap(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Invalid video URL'),
                      ));
                    }
                  },
                  child: Text(
                      state.movie.episodes?[0].server_data![index].name ?? ""),
                );
              },
            ),
          );
        }
        return Container(); // Trả về Container rỗng khi state không phải là HomeLoaded
      },
    );
  }
}
