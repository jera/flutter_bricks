import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progressWebViewFlutter = context.logger.progress('Adicionando webview_flutter');
  await Process.run('flutter', ['pub', 'add', 'webview_flutter'], runInShell: true);
  progressWebViewFlutter.complete();

  context.logger.info('Brick JERAda com sucesso!');
}
