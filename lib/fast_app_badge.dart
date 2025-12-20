import 'package:fast_app_badge/src/ios/shared.dart' as ios;
import 'package:fast_app_badge/src/macos/native.dart' as macos;
import 'package:flutter/foundation.dart';

final class FastAppBadge {
  const FastAppBadge._();

  static void requestBadgePermission({
    bool badge = true,
    bool sound = true,
    bool alert = true,
  }) {
    if (kIsWeb) return;
    if (defaultTargetPlatform != TargetPlatform.iOS) return;
    ios.requestBadgePermission(badge: badge, sound: sound, alert: alert);
  }

  static void clearBadge() {
    if (kIsWeb) return;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        ios.updateBadge(0);
      case TargetPlatform.macOS:
        macos.updateBadge(0);
      default:
        return;
    }
  }

  static void updateBadge(int count) {
    if (kIsWeb) return;
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        ios.updateBadge(count);
      case TargetPlatform.macOS:
        macos.updateBadge(count);
      default:
        return;
    }
  }
}
