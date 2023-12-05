import 'package:flutter/cupertino.dart';
import 'package:go_router_example/navigation/app_navigation.dart';

extension ContextExt on BuildContext {
  AppNavigation get navigateTo => AppNavigation(this);
}
