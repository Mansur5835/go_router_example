// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $dashboardRoute,
      $newCounterValueRoute,
    ];

RouteBase get $dashboardRoute => ShellRouteData.$route(
      navigatorKey: DashboardRoute.$navigatorKey,
      factory: $DashboardRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/main',
          factory: $MainRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'counter-screen',
              factory: $CounterRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/create-page',
          factory: $CreateRouteExtension._fromState,
        ),
      ],
    );

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) => DashboardRoute();
}

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => MainRoute();

  String get location => GoRouteData.$location(
        '/main',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CounterRouteExtension on CounterRoute {
  static CounterRoute _fromState(GoRouterState state) => CounterRoute(
        $extra: state.extra as CounterBloc,
      );

  String get location => GoRouteData.$location(
        '/main/counter-screen',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $CreateRouteExtension on CreateRoute {
  static CreateRoute _fromState(GoRouterState state) => CreateRoute();

  String get location => GoRouteData.$location(
        '/create-page',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $newCounterValueRoute => GoRouteData.$route(
      path: '/new-counter-value-route',
      factory: $NewCounterValueRouteExtension._fromState,
    );

extension $NewCounterValueRouteExtension on NewCounterValueRoute {
  static NewCounterValueRoute _fromState(GoRouterState state) =>
      NewCounterValueRoute();

  String get location => GoRouteData.$location(
        '/new-counter-value-route',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
