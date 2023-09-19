import 'package:mason/mason.dart';
import 'dart:io';

void run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');

  // Run `flutter packages get` before generation.
  await Process.run('flutter', ['pub', 'add', 'flutter_secure_storage'], runInShell: true);

  progress.complete();

  context.logger.info('Brick JERAda com sucesso!');
}
