import 'package:fast_app_badge/src/ios/bindings.g.dart';

void updateBadge(int count) {
  final app = UIApplication.sharedApplication();
  app.applicationIconBadgeNumber = count;
}
