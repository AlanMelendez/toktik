import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostRepository{
  Future<List<VideoPost>> GetTrendingVideosByPage(int page);
  Future<List<VideoPost>> GetFavoritesVideosByUser(String userId);
}
