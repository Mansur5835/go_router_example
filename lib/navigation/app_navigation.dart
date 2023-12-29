import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_example/navigation/app_router.dart';
import 'package:go_router_example/screens/counter_screen.dart';

import '../screens/create_page.dart';
import '../screens/main_screen.dart';

class AppNavigation {
  BuildContext context;
  AppNavigation(this.context);

  void counterPage() {
    return CounterRoute($extra: context.read()).go(context);
  }

  void mainPage() {
    return MainRoute().go(context);
  }

  void createPage() {
    return CreateRoute().go(context);
  }

  Future<int?> newCounterValue() {
    return NewCounterValueRoute().push(context);
  }
}
