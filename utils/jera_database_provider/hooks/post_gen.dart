import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progressSQFlite = context.logger.progress('Adicionando o sqflite');
  await Process.run('flutter', ['pub', 'add', 'sqflite'], runInShell: true);
  progressSQFlite.complete();
  final progressPath = context.logger.progress('Adicionando o path');
  await Process.run('flutter', ['pub', 'add', 'path'], runInShell: true);
  progressPath.complete();
  context.logger.info('Brick JERAda com sucesso!');
}
