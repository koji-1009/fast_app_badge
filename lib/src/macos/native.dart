import 'package:fast_app_badge/src/macos/bindings.g.dart';
import 'package:objective_c/objective_c.dart';

void updateBadge(int count) {
  final app = NSApplication.sharedApplication();
  final dockTile = app.dockTile;

  if (count == 0) {
    dockTile.badgeLabel = ''.toNSString();
  } else {
    dockTile.badgeLabel = count.toString().toNSString();
  }
}
