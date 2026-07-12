import 'package:flutter/material.dart';
import 'package:zamaan/core/di/init_dependencies.imports.dart' show init;
import 'package:zamaan/core/presentation/router.dart' show appRouter;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Zamaan',
      routerConfig: appRouter,
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}
