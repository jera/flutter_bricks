import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progressDeviceInfo = context.logger.progress('Adicionando o device_info_plus');
  await Process.run('flutter', ['pub', 'add', 'device_info_plus'], runInShell: true);
  progressDeviceInfo.complete();
  final progressFirebase = context.logger.progress('Adicionando o firebase_analytics');
  await Process.run('flutter', ['pub', 'add', 'firebase_analytics'], runInShell: true);
  progressFirebase.complete();
  final progressMixPanel = context.logger.progress('Adicionando o mixpanel_flutter');
  await Process.run('flutter', ['pub', 'add', 'mixpanel_flutter'], runInShell: true);
  progressMixPanel.complete();
}
