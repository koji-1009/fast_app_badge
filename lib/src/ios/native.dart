import 'dart:ffi';

import 'package:fast_app_badge/src/ios/bindings.g.dart';

/// Requests authorization for user notifications on iOS, including badge, sound, and alert types.
///
/// This function constructs the appropriate authorization options based on the provided
/// boolean flags and calls the native `UNUserNotificationCenter` to request permission.
void requestBadgePermission({
  required bool badge,
  required bool sound,
  required bool alert,
}) {
  final center = UNUserNotificationCenter.currentNotificationCenter();
  final options = (badge ? 1 : 0) | (sound ? 2 : 0) | (alert ? 4 : 0);
  center.requestAuthorizationWithOptions(options, completionHandler: nullptr);
}

/// Updates the application icon badge number on iOS.
///
/// This function accesses the shared `UIApplication` instance and sets its
/// `applicationIconBadgeNumber` property to the given [count].
void updateBadge(int count) {
  final app = UIApplication.sharedApplication();
  app.applicationIconBadgeNumber = count;
}
