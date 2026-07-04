part of 'init_dependencies.imports.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // 1. Register Hive boxes (must be after HiveInitializer.init())
  initHiveBoxes();

  // 2. Register hive data sources (depend on boxes)
  initHiveDataSources();

  // 3. Register mappers (pure Dart, no dependencies)
  initMappers();

  // 4. Register current user provider
  await initUserProvider();

  // 5. Register local-user use cases
  initUseCases();

  // 6. Register repositories (depend on data sources, mappers, current user)
  initRepositories();
}
