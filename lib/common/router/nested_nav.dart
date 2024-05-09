import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: badges.Badge(
                badgeContent: const Text('3'),
                badgeStyle: badges.BadgeStyle(
                    badgeColor: Theme.of(context).colorScheme.primary),
                child: const Icon(Icons.shopping_bag),
              ),
              label: 'Cart'),
          const NavigationDestination(
              icon: Icon(Icons.shopping_basket), label: 'Orders'),
          const NavigationDestination(
              icon: Icon(Icons.manage_accounts), label: 'Profile'),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
