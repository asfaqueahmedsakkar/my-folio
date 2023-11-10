import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart';

abstract class RouteManager {
  static pushRouteToRoot(String route) {
    if (kIsWeb) {
      Future.delayed(const Duration(milliseconds: 100),
          () => window.history.replaceState(null, "Portfolio", route));
    }
  }

  static pushRoute(String route) {
    if (kIsWeb) {
      Future.delayed(const Duration(milliseconds: 100),
          () => window.history.pushState(null, "Portfolio", route));
    }
  }

  static replaceRoute(String route) {
    var list = Uri.base.path.split("/");
    String root = list.sublist(0, (Uri.base.path.split("/").length - 1).clamp(0, 1000)).join("/");
    if (kIsWeb) {
      Future.delayed(const Duration(milliseconds: 100),
          () => window.history.pushState(null, "Portfolio", "$root/$route"));
    }
  }
}
