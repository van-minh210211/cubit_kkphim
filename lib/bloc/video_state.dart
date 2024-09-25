part of 'video_cubit.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoaded extends VideoState {
  final String videoUrl;
  VideoLoaded(this.videoUrl);

  @override
  List<Object> get props => [videoUrl];
}
