import './post_model.dart';
import '../service/post_service.dart';

class PostRepository {
  final PostService _postService = PostService();
  Future<List<PostModel>> fetchData() async {
    return _postService.fetchData();
  }
}
