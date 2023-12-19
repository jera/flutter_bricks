import 'package:flutter/material.dart';

import 'component/{{name.snakeCase()}}_item.dart';

abstract class {{name.pascalCase()}}ViewModelProtocol {
  bool get isEmpty;
  bool get isLoading;

  List<{{name.pascalCase()}}ItemViewModelProtocol> get itemViewModels;
}

class {{name.pascalCase()}}View extends StatelessWidget {
  final {{name.pascalCase()}}ViewModelProtocol viewModel;

  const {{name.pascalCase()}}View({required this.viewModel, super.key});
  {{#has_sliver}}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              centerTitle: true,
              expandedHeight: 88,
              pinned: true,
              title: const Text('Sliver List'),
              backgroundColor: Colors.grey.shade400,
            ),
            _bodyWidget,
          ],
        ),
      ),
    );
  }

  Widget get _bodyWidget {
    if (viewModel.isLoading) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.grey.shade400,
          ),
        ),
      );
    }

    if (viewModel.isEmpty) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.assignment_rounded),
            SizedBox(height: 12),
            Text(
              'Nenhuma informação encontrada!',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          viewModel.itemViewModels.map((viewModel) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: {{name.pascalCase()}}Item(viewModel: viewModel),
            );
          }).toList(),
        ),
      ),
    );
  }
  {{/has_sliver}}
  {{^has_sliver}}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List View')),
      body: _bodyWidget,
    );
  }

  Widget get _bodyWidget {
    if (viewModel.isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.grey.shade400,
        ),
      );
    }

    if (viewModel.isEmpty) {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment_rounded),
          SizedBox(height: 12),
          Text(
            'Nenhuma informação encontrada!',
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return ListView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      children: viewModel.itemViewModels.map((viewModel) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: {{name.pascalCase()}}Item(viewModel: viewModel),
        );
      }).toList(),
    );
  }
  {{/has_sliver}}
}
