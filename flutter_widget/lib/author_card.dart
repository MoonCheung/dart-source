import 'package:flutter/material.dart';
import 'circle_image.dart';
import 'fooderlich_theme.dart';

// 作者卡片自定义小部件
class AuthorCard extends StatefulWidget {
  // 有三个参数其中authorName, title均为必填，imageProvider是可选参数
  const AuthorCard(
      {Key? key,
      required this.authorName,
      required this.title,
      this.imageProvider})
      : super(key: key);

  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    // TODO: Replace return Container(...);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            CircleImage(imageProvider: widget.imageProvider, imageRadius: 28),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.authorName,
                    style: FooderlichTheme.lightTextTheme.headline2),
                Text(
                  widget.title,
                  style: FooderlichTheme.lightTextTheme.headline3,
                )
              ],
            )
          ]),
          // TODO 2: add IconButton
          IconButton(
              icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
              iconSize: 30,
              color: Colors.red[400],
              onPressed: () {
                const snackBar = SnackBar(content: Text('Favorite Pressed'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                setState(() {
                  _isFavorited = !_isFavorited;
                });
              })
        ],
      ),
    );
  }
}
