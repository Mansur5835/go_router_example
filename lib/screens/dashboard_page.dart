import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/navigation/extension/context_ext.dart';
import 'package:go_router_example/screens/create_page.dart';
import 'package:go_router_example/screens/main_screen.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.routes});

  final Widget routes;

  @override
  Widget build(BuildContext context) {
    final currentRoute =
        GoRouter.of(context).routerDelegate.currentConfiguration.matches.last;
    return Scaffold(
      body: routes,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentRoute.matchedLocation.currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              return context.navigateTo.mainPage();
            case 1:
              return context.navigateTo.createPage();
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
        ],
      ),
    );
  }
}

extension _StringExt on String {
  int get currentIndex {
    if (this.startsWith(MainScreen.path)) {
      return 0;
    } else if (this.startsWith(CreatePage.path)) {
      return 1;
    }
    return 0;
  }
}
