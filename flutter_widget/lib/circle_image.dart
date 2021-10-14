import 'package:flutter/material.dart';

// 图像自定义小部件
class CircleImage extends StatelessWidget {
  // 有两个可选参数: imageProvider, imageRadius 可以传入
  const CircleImage({
    Key? key,
    this.imageProvider,
    this.imageRadius = 20,
  }) : super(key: key);

  final double imageRadius;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageRadius,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: imageRadius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }
}
