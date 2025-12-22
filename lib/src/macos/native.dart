import 'package:fast_app_badge/src/macos/bindings.g.dart';
import 'package:objective_c/objective_c.dart';

/// Updates the application icon badge label on macOS.
///
/// This function accesses the shared `NSApplication` instance, retrieves its
/// dock tile, and sets the `badgeLabel` property to the string representation
/// of the given [count]. If [count] is 0, the badge label is cleared.
void updateBadge(int count) {
  final app = NSApplication.sharedApplication();
  final dockTile = app.dockTile;

  if (count == 0) {
    dockTile.badgeLabel = ''.toNSString();
  } else {
    dockTile.badgeLabel = count.toString().toNSString();
  }
}
