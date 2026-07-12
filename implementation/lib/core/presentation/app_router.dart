import 'package:flutter/material.dart';
import '../../features/auth/presentation/screens/auth_bootstrap_screen.dart';
import '../../features/task_center/presentation/screens/task_list_screen.dart';

class AppRouter {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case '/tasks':
        return MaterialPageRoute(builder: (_) => const TaskListScreen());
      case '/':
      default:
        return MaterialPageRoute(builder: (_) => const AuthBootstrapScreen());
    }
  }
}
