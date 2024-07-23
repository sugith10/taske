import 'dart:developer';

import 'package:flutter/material.dart';

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    log('Pushed route: ${route.settings.name}', time: null);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    log('Popped route: ${route.settings.name}', time: null);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    log('Removed route: ${route.settings.name}', time: null);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    log(
      'Replaced route: ${oldRoute?.settings.name} with ${newRoute?.settings.name}',
      time: null,
    );
  }
}
