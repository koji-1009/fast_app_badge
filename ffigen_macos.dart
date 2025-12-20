// Regenerate bindings with `dart run ffigen_macos.dart`.
import 'package:ffigen/ffigen.dart';

final config = FfiGenerator(
  headers: Headers(entryPoints: [Uri.file('stub_headers/macos.h')]),
  objectiveC: ObjectiveC(
    interfaces: Interfaces.includeSet({'NSApplication', 'NSDockTile'}),
  ),
  output: Output(dartFile: Uri.file('lib/src/macos/bindings.g.dart')),
);

void main() => config.generate();
