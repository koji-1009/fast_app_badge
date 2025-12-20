// Regenerate bindings with `dart run ffigen_ios.dart`.
import 'package:ffigen/ffigen.dart';

final config = FfiGenerator(
  headers: Headers(entryPoints: [Uri.file('stub_headers/ios.h')]),
  objectiveC: ObjectiveC(interfaces: Interfaces.includeSet({'UIApplication'})),
  output: Output(dartFile: Uri.file('lib/src/ios/bindings.g.dart')),
);

void main() => config.generate();
