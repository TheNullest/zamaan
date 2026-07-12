import 'package:go_router/go_router.dart';
// lightweight router - no widget imports needed here
import 'package:zamaan/core/di/init_dependencies.imports.dart' show sl;
import 'package:zamaan/shared/domain/repositories/current_user_provider.dart';
import 'package:zamaan/features/auth/presentation/screens/auth_bootstrap_screen.dart';
import 'package:zamaan/features/task_center/presentation/screens/task_list_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    try {
      final CurrentUserProvider provider = sl<CurrentUserProvider>();
      final user = provider.currentUser;
      final loc = state.uri.toString();
      if (user == null && loc != '/') return '/';
      if (user != null && loc == '/') return '/tasks';
    } catch (_) {
      // If DI not ready, don't redirect
    }
    return null;
  },
  routes: [
    GoRoute(path: '/', builder: (ctx, state) => const AuthBootstrapScreen()),
    GoRoute(path: '/tasks', builder: (ctx, state) => const TaskListScreen()),
  ],
);
