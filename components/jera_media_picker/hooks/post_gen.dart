import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('Installing packages');

  await Process.run('flutter', ['pub', 'add', 'image_picker'], runInShell: true);

  progress.complete();
  context.logger.info('Brick JERAda com sucesso!');
}
