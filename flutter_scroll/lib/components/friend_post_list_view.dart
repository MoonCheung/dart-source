import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';

class FriendPostListView extends StatelessWidget {
  FriendPostListView({Key? key, required this.friendPosts}) : super(key: key);

  final List<Post> friendPosts;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
        child: Column(
          // 十字轴对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 4
            Text('Social Chefs 👩‍🍳',
                style: Theme.of(context).textTheme.headline1),
            // 5
            const SizedBox(height: 16),
            // TODO: Add PostListView here
            // 6
            ListView.separated(
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: friendPosts.length,
              itemBuilder: (BuildContext context, index) {
                final post = friendPosts[index];
                return FriendPostTile(post: post);
              },
              separatorBuilder: (BuildContext context, index) {
                return const SizedBox(height: 16);
              },
            )
          ],
        ));
  }
}
