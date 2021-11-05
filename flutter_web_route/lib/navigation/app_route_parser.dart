import 'package:flutter/material.dart';
import 'app_link.dart';

class AppRouteParser extends RouteInformationParser<AppLink> {
  @override
  Future<AppLink> parseRouteInformation(
      RouteInformation routeInformation) async {
    final link = AppLink.fromLocation(routeInformation.location);
    return link;
  }

  @override
  RouteInformation restoreRouteInformation(AppLink applink) {
    final location = applink.toLocation();
    return RouteInformation(location: location);
  }
}
