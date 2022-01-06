import 'package:flutter/material.dart';
import './post_model.dart';
import './post_repository.dart';

// 元祖类型
enum SortState { sortWithId, sortWithTitle, sortWithBody, sortWithUserId }

class PostProvider extends ChangeNotifier {
  final PostRepository _postRepository = PostRepository();

  SortState _sortState = SortState.sortWithId;
  // 获取sortState
  SortState get sortState => _sortState;

  List<PostModel> _posts = [];
  // 获取数据
  List<PostModel> get posts => _posts;

  fetchData(SortState sortState) async {
    _sortState = sortState;
    _posts = await _postRepository.fetchData();
    if (_sortState == SortState.sortWithId) {
      // compareTo: 把这个和另一个作比较。如果该值小于其他值，则返回负数;如果它们相等，则返回零;如果该值大于其他值，则返回正数。
      _posts.sort((a, b) => a.id.compareTo(b.id));
    } else if (_sortState == SortState.sortWithTitle) {
      _posts.sort((a, b) => a.title.compareTo(b.title));
    } else if (_sortState == SortState.sortWithBody) {
      _posts.sort((a, b) => a.body.compareTo(b.body));
    } else if (_sortState == SortState.sortWithUserId) {
      _posts.sort((a, b) => a.userId.compareTo(b.userId));
    }
    notifyListeners();
  }
}
