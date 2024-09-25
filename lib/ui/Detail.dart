import 'package:apinew/bloc/home_cubit.dart';
import 'package:apinew/bloc/video_cubit.dart';
import 'package:apinew/data.dart';
import 'package:apinew/widget/YouToBe.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/api_listhome.dart';
class DetailScreen extends StatefulWidget {
  DetailScreen({required this.url, super.key});

  String? url;

  @override
  State<DetailScreen> createState() => _DetailState();
}

class _DetailState extends State<DetailScreen> {
  late HomeCubit movie;
  late VideoCubit video;
  final url = Data(Dio());
  String? currentUrl;

  @override
  void initState() {
    super.initState();
    movie = HomeCubit(url);
    movie.datadetail(widget.url ?? '');
    video = VideoCubit();
    currentUrl = "";
  }

  // Hàm cập nhật URL mới và gọi phương thức video của VideoCubit
  void newapi(String newm) {
    setState(() {
      currentUrl = newm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(
            create: (context) => movie,
          ),
          BlocProvider<VideoCubit>(
            create: (context) => video,
          ),
        ],
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeDetail) {
              String urlToPlay = currentUrl!.isNotEmpty
                  ? currentUrl!
                  : state.movie.movie?.trailer_url ?? "";
              context.read<VideoCubit>().video(urlToPlay);
              if (currentUrl!.isEmpty) {
                context.read<VideoCubit>().video(urlToPlay);
              }

              return Column(
                children: [
                  Container(
                    height: 200,
                    child: BlocBuilder<VideoCubit, VideoState>(
                      builder: (context, videoState) {
                        if (videoState is VideoLoaded) {
                          return YoutubeVideoPlayerFlutter(
                            // Lấy URL từ Cubit
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  Text(state.movie.movie!.name ?? ""),
                  Text(state.movie.movie!.time ?? ""),
                  Center(
                    child: TestData(
                      onEpisodeTap: newapi, // Gọi hàm newapi khi chọn tập mới
                    ),
                  ),
                  Text(state.movie.movie!.content ?? "")
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}