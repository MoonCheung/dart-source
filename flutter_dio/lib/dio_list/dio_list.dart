import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dio/dio_list/controller/post_controller.dart';
import 'package:flutter_dio/dio_list/model/post_model.dart';

class DioList extends StatelessWidget {
  DioList({Key? key, required this.title}) : super(key: key);
  final String title;
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            PopupMenuButton<SortState>(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text('使用 userId 排序'),
                  value: SortState.userID,
                ),
                const PopupMenuItem(
                  child: Text('使用 id 排序'),
                  value: SortState.id,
                ),
                const PopupMenuItem(
                  child: Text('使用 title 排序'),
                  value: SortState.title,
                ),
                const PopupMenuItem(
                  child: Text('使用 body 排序'),
                  value: SortState.body,
                )
              ],
              onSelected: (SortState value) {
                Get.find<PostController>().sort(value);
              },
            )
          ],
        ),
        body: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.postList.length,
                itemBuilder: (context, index) {
                  PostModel item = controller.postList[index];
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.blueAccent, width: 2.0)),
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                              text: item.id.toString() + ". " + item.title,
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                            TextSpan(
                              text: '\n' + item.body,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "\nUser ID：" + item.userId.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ));
                },
              )));
  }
}
