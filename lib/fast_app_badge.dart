import 'package:fast_app_badge/src/ios/shared.dart' as ios;
import 'package:fast_app_badge/src/macos/native.dart' as macos;
import 'package:flutter/foundation.dart';

/// A Flutter plugin for quickly and efficiently managing application badge counts on iOS and macOS.
///
/// This class provides static methods to interact with the native platform
/// to request badge permissions, update the badge count, and clear the badge.
final class FastAppBadge {
  const FastAppBadge._();

  /// Requests permission to display notifications, including badges, sounds, and alerts.
  ///
  /// This method is primarily relevant for iOS. On other platforms or web, it does nothing.
  ///
  /// - [badge]: Whether to request permission for badge display. Defaults to `true`.
  /// - [sound]: Whether to request permission for sound notifications. Defaults to `true`.
  /// - [alert]: Whether to request permission for alert notifications. Defaults to `true`.
  static void requestBadgePermission({
    bool badge = true,
    bool sound = true,
    bool alert = true,
  }) {
    if (kIsWeb) return;
    if (defaultTargetPlatform != TargetPlatform.iOS) return;
    ios.requestBadgePermission(badge: badge, sound: sound, alert: alert);
  }

  /// Clears the application badge count by setting it to 0.
  ///
  /// This method is supported on iOS and macOS. On other platforms or web, it does nothing.
  static void clearBadge() {
    if (kIsWeb) return;
    switch (defaultTargetPlatform) {
      case .iOS:
        ios.updateBadge(0);
      case .macOS:
        macos.updateBadge(0);
      default:
        return;
    }
  }

  /// Updates the application badge count to the specified [count].
  ///
  /// This method is supported on iOS and macOS. On other platforms or web, it does nothing.
  ///
  /// - [count]: The integer value to set the badge count to.
  static void updateBadge(int count) {
    if (kIsWeb) return;
    switch (defaultTargetPlatform) {
      case .iOS:
        ios.updateBadge(count);
      case .macOS:
        macos.updateBadge(count);
      default:
        return;
    }
  }
}
