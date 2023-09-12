import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progress = context.logger.progress('adicionando o device_info_plus');
  await Process.run('flutter', ['pub', 'add', 'device_info_plus'], runInShell: true);
  progress.complete();
}
