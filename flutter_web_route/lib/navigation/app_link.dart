import 'package:flutter/material.dart';

/**
 * AppLink是您的导航状态对象
 * 为每个 URL 路径创建常量。
 * 为您将支持的每个查询参数创建常量。
 * 使用 存储 URL 的路径location。
 * 使用currentTab存储你想将用户重定向到的标签。
 * 将要查看的项目的 ID 存储在 中itemId。
 * 使用位置和两个查询参数初始化应用程序链接。
 */
class AppLink {
  // 1
  static const String kHomePath = '/home';
  static const String kOnboardingPath = '/onboarding';
  static const String kLoginPath = '/login';
  static const String kProfilePath = '/profile';
  static const String kItemPath = '/item';
  // 2
  static const String kTabParam = 'tab';
  static const String kIdParam = 'id';
  // 3
  String? location;
  // 4
  int? currentTab;
  // 5
  String? itemId;

  AppLink({this.location, this.currentTab, this.itemId});

  // TODO: Add fromLocation
  /**
   * 将 URL 字符串转换为AppLink
   * 首先，您需要解码 URL。URL 通常在其路径中包含特殊字符，因此您需要对URL 路径进行百分比编码。例如，您将编码hello!world为hello%21world.
   * 解析查询参数键和键值对的 URI。
   * currentTab如果存在，则从 URL 路径中提取。
   * itemId如果存在，则从 URL 路径中提取。
   * AppLink通过传入您从 URL 字符串中提取的查询参数来创建 。
   * 返回 的实例AppLink。
   */
  static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;

    final currentTab = int.tryParse(params[AppLink.kTabParam] ?? '');
    final itemId = params[AppLink.kIdParam];

    final link =
        AppLink(location: uri.path, currentTab: currentTab, itemId: itemId);

    return link;
  }

  // TODO: Add toLocation
  // 将 AppLink 转换为 URL 字符串
  // 该应用程序还需要逆向转换，从 AppLink 到简单字符串
  String toLocation() {
    String addKeyValPair({required String key, String? value}) =>
        value == null ? '' : '${key}=$value&';

    switch (location) {
      // 3
      case kLoginPath:
        return kLoginPath;
      // 4
      case kOnboardingPath:
        return kOnboardingPath;
      // 5
      case kProfilePath:
        return kProfilePath;
      // 6
      case kItemPath:
        var loc = '$kItemPath?';
        loc += addKeyValPair(
          key: kIdParam,
          value: itemId,
        );
        return Uri.encodeFull(loc);
      // 7
      default:
        var loc = '$kHomePath?';
        loc += addKeyValPair(
          key: kTabParam,
          value: currentTab.toString(),
        );
        return Uri.encodeFull(loc);
    }
  }
}
