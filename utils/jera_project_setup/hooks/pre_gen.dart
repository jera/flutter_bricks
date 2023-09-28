import 'package:mason/mason.dart';
import 'dart:io';

void run(HookContext context) async {
  final projectDirectory = context.vars['project_name'];
  final hasForceUpdate = context.vars['has_force_update'];
  final projectDirectoryFormat = projectDirectory.replaceAll(' ', '_').toLowerCase();

  if (hasForceUpdate) {
    final progressImportForceUpdate = context.logger.progress('Installing mason brick jera_force_update');
    await Process.run('mason', ['add', 'jera_force_update'], runInShell: true);
    progressImportForceUpdate.complete();

    final progressForceUpdate = context.logger.progress('Generate brick jera_force_update');
    await Process.run(
      'mason',
      ['make', 'jera_force_update', '-o additional'],
      runInShell: true,
    );
    progressForceUpdate.complete();
  }
}
