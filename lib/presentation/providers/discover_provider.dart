import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';

class DiscoverProvider extends ChangeNotifier {

  final VideoPostsRepositoryImplementation videoPostsRepositoryImplementation;
  DiscoverProvider({required this.videoPostsRepositoryImplementation});

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {

    final newVideos = await videoPostsRepositoryImplementation.GetTrendingVideosByPage(1);

    videos.addAll(newVideos);

    initialLoading = false;

    //todo: cargar videos

    notifyListeners();
  }
}
