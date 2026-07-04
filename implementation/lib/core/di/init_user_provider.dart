part of 'init_dependencies.imports.dart';

Future<void> initUserProvider() async {
  // Provide your concrete implementation of CurrentUserProvider
  final userProvider = CurrentUserProviderImpl(
    dataSource: sl<UserLocalDataSource>(),
    mapper: sl<UserMapper>(),
  );

  await userProvider.load(); // Load the current user from storage
  sl.registerLazySingleton<CurrentUserProvider>(() => userProvider);
}
