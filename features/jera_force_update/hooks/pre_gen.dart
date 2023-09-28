import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');

  // Run `flutter packages get` before generation.
  await Process.run('flutter', ['pub', 'add', 'package_info_plus'], runInShell: true);
  await Process.run('flutter', ['pub', 'add', 'url_launcher'], runInShell: true);

  progress.complete();
}
