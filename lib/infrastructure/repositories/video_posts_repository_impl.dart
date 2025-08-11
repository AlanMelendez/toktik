import 'package:toktik/domain/datasources/video_post_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImplementation implements VideoPostRepository {

  final VideoPostDataSource videosDatasource;

  VideoPostsRepositoryImplementation({required this.videosDatasource});

  @override
  Future<List<VideoPost>> GetFavoritesVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> GetTrendingVideosByPage(int page) {
    return videosDatasource.GetTrendingVideosByPage(page);
  }

}