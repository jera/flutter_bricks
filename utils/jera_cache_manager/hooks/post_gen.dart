import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progressSharedPreferences = context.logger.progress('Adicionando o shared preferences');
  await Process.run('flutter', ['pub', 'add', 'shared_preferences'], runInShell: true);
  progressSharedPreferences.complete();

  context.logger.info('Brick JERAda com sucesso!');
}
