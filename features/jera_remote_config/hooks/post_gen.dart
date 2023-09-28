import 'package:mason/mason.dart';
import 'dart:io';

void run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');

  await Process.run('flutter', ['pub', 'add', 'firebase_remote_config'], runInShell: true);

  progress.complete();
  context.logger.info('Brick JERAda com sucesso!');
}
