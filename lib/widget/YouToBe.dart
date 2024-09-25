import 'package:apinew/bloc/video_cubit.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class YoutubeVideoPlayerFlutter extends StatefulWidget {
  YoutubeVideoPlayerFlutter({super.key});

  @override
  State<YoutubeVideoPlayerFlutter> createState() =>
      _YoutubeVideoPlayerFlutterState();
}

class _YoutubeVideoPlayerFlutterState extends State<YoutubeVideoPlayerFlutter> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  YoutubePlayerController? _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    // Không khởi tạo player ở đây, sẽ khởi tạo khi BlocBuilder có dữ liệu mới
  }

  @override
  void didUpdateWidget(covariant YoutubeVideoPlayerFlutter oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Hủy các controller khi widget thay đổi
    _disposeControllers();
  }

  void _initializePlayer(String url) {
    if (url.contains("youtube.com")) {
      final videoId = YoutubePlayer.convertUrlToId(url);
      if (videoId != null) {
        _youtubePlayerController = YoutubePlayerController(
          initialVideoId: videoId,
          flags: YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
          ),
        );
      }
    } else {
      _videoPlayerController = VideoPlayerController.network(url);
      _videoPlayerController.initialize().then((_) {
        setState(() {
          _chewieController = ChewieController(
            videoPlayerController: _videoPlayerController,
            autoPlay: false,
            looping: false,
          );
        });
      });
    }
  }

  void _disposeControllers() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    _youtubePlayerController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        if (state is VideoLoaded) {
          final urlToPlay = state.videoUrl;
          _initializePlayer(urlToPlay);

          return Center(
            child: urlToPlay.contains("youtube.com")
                ? _youtubePlayerController != null
                ? YoutubePlayer(
              controller: _youtubePlayerController!,
              showVideoProgressIndicator: true,
            )
                : CircularProgressIndicator()
                : _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
                ? Chewie(controller: _chewieController!)
                : CircularProgressIndicator(),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }
}
