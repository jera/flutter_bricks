import 'package:mason/mason.dart';
import 'dart:io';

void run(HookContext context) async {
  String currentDirectory = await Directory.current.path.split('/').last;
  context.vars['project_name'] = currentDirectory;
}
