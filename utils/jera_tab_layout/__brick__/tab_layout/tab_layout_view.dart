import 'package:flutter/material.dart';

abstract class TabLayoutViewModelProtocol with ChangeNotifier {}

class TabLayoutView extends StatelessWidget {
  final TabLayoutViewModelProtocol viewModel;

  const TabLayoutView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // TODO Altere com a DefaultAppBar do seu projeto
        appBar: AppBar(title: const Text('Tab Layout')),
        body: const SafeArea(
          child: Column(
            children: [
              // TODO Altere o estilo da TabBar de acordo com o design do projeto
              TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home)),
                  Tab(icon: Icon(Icons.table_rows_sharp)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  // TODO Altere o conteúdo de cada tela respectivamente
                  children: [
                    Center(child: Text('Primeira tela')),
                    Center(child: Text('Segunda tela')),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
