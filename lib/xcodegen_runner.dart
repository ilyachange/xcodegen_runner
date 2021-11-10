import 'dart:io';

import 'package:build/build.dart';

Builder build(BuilderOptions options) {
  var executable = 'xcodegen';
  final arguments = <String>["generate", "-s", "ios/project.yml"];

  Future(() async {
    final process = await Process.start(executable, arguments, runInShell: true);
    await stdout.addStream(process.stdout);
    await stderr.addStream(process.stderr);
    await process.exitCode;
  });

  return _EmptyBuilder();
}

class _EmptyBuilder extends Builder {
  @override
  Future<void> build(BuildStep buildStep) async {}

  @override
  Map<String, List<String>> get buildExtensions => {};
}