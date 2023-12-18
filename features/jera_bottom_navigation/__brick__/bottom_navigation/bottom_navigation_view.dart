import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class BottomNavigationViewModelProtocol with ChangeNotifier {
  void didTapSelectedIndex(int index);
}

class BottomNavigationView extends StatelessWidget {
  final BottomNavigationViewModelProtocol viewModel;
  final StatefulNavigationShell navigationShell;

  const BottomNavigationView({super.key, required this.viewModel, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, __) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blue,
            currentIndex: navigationShell.currentIndex,
            onTap: viewModel.didTapSelectedIndex,
            showUnselectedLabels: true,
            selectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(Icons.settings),
              )
            ],
          ),
        );
      },
    );
  }
}
