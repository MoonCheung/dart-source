import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/circle_image.dart';
import '../models/models.dart';

class ProfileScreen extends StatefulWidget {
  // TODO: ProfileScreen MaterialPage Helper
  static MaterialPage page(User user) {
    return MaterialPage(
        name: FooderlichPages.profilePath,
        key: ValueKey(FooderlichPages.profilePath),
        child: ProfileScreen(user: user));
  }

  final User user;
  const ProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // TODO: Close Profile Screen
            // 这将处理用户点击X（关闭）按钮时发生的操作。它更新配置文件状态，以便导航器删除配置文件屏幕
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            buildProfile(),
            Expanded(
              child: buildMenu(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenu() {
    return ListView(
      children: [
        buildDarkModeRow(),
        ListTile(
          title: const Text('View raywenderlich.com'),
          onTap: () {
            // TODO: Open raywenderlich.com webview
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnRaywenderlich(true);
          },
        ),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
            // TODO: Logout user
            // 1
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
            // 2
            Provider.of<AppStateManager>(context, listen: false).logout();
          },
        )
      ],
    );
  }

  Widget buildDarkModeRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark Mode'),
          Switch(
            value: widget.user.darkMode,
            onChanged: (value) {
              Provider.of<ProfileManager>(context, listen: false).darkMode =
                  value;
            },
          )
        ],
      ),
    );
  }

  Widget buildProfile() {
    return Column(
      children: [
        CircleImage(
          imageProvider: AssetImage(widget.user.profileImageUrl),
          imageRadius: 60.0,
        ),
        const SizedBox(height: 16.0),
        Text(
          widget.user.firstName,
          style: const TextStyle(
            fontSize: 21,
          ),
        ),
        Text(widget.user.role),
        Text(
          '${widget.user.points} points',
          style: const TextStyle(
            fontSize: 30,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
