import 'package:flutter/material.dart';

import '../../support/utils/service_locator/service_locator.dart';
import 'components/{{name.snakeCase()}}_item_view.dart';

abstract class {{name.pascalCase()}}ViewModelProtocol {
  List< {{name.pascalCase()}}ItemViewModelProtocol> get itemViewModels;
}

class {{name.pascalCase()}}View extends StatefulWidget {
  const {{name.pascalCase()}}View({super.key});

  @override
  State<{{name.pascalCase()}}View> createState() => _{{name.pascalCase()}}ViewState();
}

class _{{name.pascalCase()}}ViewState extends State<{{name.pascalCase()}}View> {
  final viewModel = ServiceLocator.get<{{name.pascalCase()}}ViewModelProtocol>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        centerTitle: true,
        title: const Text('Grid List'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: viewModel.itemViewModels.length,
          itemBuilder: (_, index) {
            return  {{name.pascalCase()}}ItemView(
              viewModel: viewModel.itemViewModels[index],
            );
          },
        ),
      ),
    );
  }
}
