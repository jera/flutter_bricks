import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final withGoRouter = context.vars['with_go_router'];
  final hasForceUpdate = context.vars['has_force_update'];
  
  if (withGoRouter) {
    final progressGoRouter = context.logger.progress('Adicionando o go_router');
    await Process.run('flutter', ['pub', 'add', 'go_router'], runInShell: true);
    progressGoRouter.complete();
  }
  final progressGetIt = context.logger.progress('Adicionando o get_it');
  await Process.run('flutter', ['pub', 'add', 'get_it'], runInShell: true);
  progressGetIt.complete();
  final progressUrlLauncher = context.logger.progress('Adicionando o url_launcher');
  await Process.run('flutter', ['pub', 'add', 'url_launcher'], runInShell: true);
  progressUrlLauncher.complete();
  final progressPackageInfoPlus = context.logger.progress('Adicionando o package_info_plus');
  await Process.run('flutter', ['pub', 'add', 'package_info_plus'], runInShell: true);
  progressPackageInfoPlus.complete();
  final progressDio = context.logger.progress('Adicionando o dio');
  await Process.run('flutter', ['pub', 'add', 'dio'], runInShell: true);
  progressDio.complete();
  final progressPrettyDioLogger = context.logger.progress('Adicionando o pretty_dio_logger');
  await Process.run('flutter', ['pub', 'add', 'pretty_dio_logger'], runInShell: true);
  progressPrettyDioLogger.complete();
    final progressIntl = context.logger.progress('Adicionando o intl');
  await Process.run('flutter', ['pub', 'add', 'intl'], runInShell: true);
  progressIntl.complete();

  context.logger.info('Brick JERAda com sucesso!');
}
