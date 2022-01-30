import 'package:flutter_demo/views/provider/provider_data/model/post_model.dart';
import 'package:flutter_demo/views/provider/provider_data/service/post_service.dart';

class PostRepository {
  final PostService _postService = PostService();
  Future<List<PostModel>> fetchData() async {
    return _postService.fetchData();
  }
}
