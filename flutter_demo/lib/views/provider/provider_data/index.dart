import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/views/provider/provider_data/model/post_provider.dart';

class ProviderList extends StatefulWidget {
  const ProviderList({Key? key}) : super(key: key);

  @override
  _ProviderListState createState() => _ProviderListState();
}

class _ProviderListState extends State<ProviderList> {
  @override
  void initState() {
    super.initState();
    context.read<PostProvider>().fetchData(SortState.sortWithId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider List'),
        actions: <Widget>[
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text('使用 userId 排序'),
                      value: SortState.sortWithUserId,
                    ),
                    const PopupMenuItem(
                      child: Text('使用 id 排序'),
                      value: SortState.sortWithId,
                    ),
                    const PopupMenuItem(
                      child: Text('使用 title 排序'),
                      value: SortState.sortWithTitle,
                    ),
                    const PopupMenuItem(
                      child: Text('使用 body 排序'),
                      value: SortState.sortWithBody,
                    )
                  ],
              onSelected: (SortState value) {
                context.read<PostProvider>().fetchData(value);
              })
        ],
      ),
      body: const MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.watch<PostProvider>().posts.length,
      itemBuilder: (context, index) {
        final post = context.watch<PostProvider>().posts[index];
        return Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: Colors.white,
                border: Border.all(color: Colors.blueAccent, width: 2.0)),
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: post.id.toString() + ". " + post.title,
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  TextSpan(
                    text: '\n' + post.body,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "\nUser ID：" + post.userId.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
