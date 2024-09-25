import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());
  void video(String url) {
    emit(VideoLoaded(url = url));
  }
}
