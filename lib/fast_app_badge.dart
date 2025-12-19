import 'package:fast_app_badge/src/ios/shared.dart' as ios;
import 'package:flutter/foundation.dart';

final class FastAppBadge {
  const FastAppBadge._();

  static void clearBadge() {
    if (kIsWeb) return;
    if (defaultTargetPlatform != TargetPlatform.iOS) return;
    ios.updateBadge(0);
  }

  static void updateBadge(int count) {
    if (kIsWeb) return;
    if (defaultTargetPlatform != TargetPlatform.iOS) return;
    ios.updateBadge(count);
  }
}
