import 'dart:ffi';

import 'package:fast_app_badge/src/ios/bindings.g.dart';

void requestBadgePermission({
  required bool badge,
  required bool sound,
  required bool alert,
}) {
  final center = UNUserNotificationCenter.currentNotificationCenter();
  final options = (badge ? 1 : 0) | (sound ? 2 : 0) | (alert ? 4 : 0);
  center.requestAuthorizationWithOptions(options, completionHandler: nullptr);
}

void updateBadge(int count) {
  final app = UIApplication.sharedApplication();
  app.applicationIconBadgeNumber = count;
}
