import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/blocs/counter_bloc.dart';
import 'package:go_router_example/screens/create_page.dart';
import 'package:go_router_example/screens/new_counter_value_screen.dart';

import '../screens/counter_screen.dart';
import '../screens/dashboard_page.dart';
import '../screens/main_screen.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<DashboardRoute>(routes: [
  TypedGoRoute<MainRoute>(
    path: MainScreen.path,
    routes: [
      TypedGoRoute<CounterRoute>(
        path: CounterRoute.path,
      ),
    ],
  ),
  TypedGoRoute<CreateRoute>(
    path: CreatePage.path,
  ),
])
class DashboardRoute extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  static ValueNotifier<Widget?> control = ValueNotifier(null);

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return DashboardPage(
      routes: navigator,
    );
  }
}

class MainRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      child: BlocProvider(
        create: (context) => CounterBloc(),
        child: const MainScreen(),
      ),
    );
  }
}

class CreateRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(child: CreatePage());
  }
}

@TypedGoRoute<NewCounterValueRoute>(path: NewCounterValuePage.path)
class NewCounterValueRoute extends GoRouteData {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const CupertinoPage(child: NewCounterValuePage());
  }
}

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: MainScreen.path,
  routes: $appRoutes,
);
