part of 'init_dependencies.imports.dart';

void initUseCases() {
  sl.registerLazySingleton<CreateLocalUserUseCase>(
    () => CreateLocalUserUseCase(sl<UserRepository>()),
  );

  sl.registerLazySingleton<GetCurrentUserUseCase>(
    () => GetCurrentUserUseCase(sl<UserRepository>()),
  );

  sl.registerLazySingleton<UpdateCurrentUserProfileUseCase>(
    () => UpdateCurrentUserProfileUseCase(sl<UserRepository>()),
  );

  sl.registerLazySingleton<MarkUserAsRegisteredUseCase>(
    () => MarkUserAsRegisteredUseCase(sl<UserRepository>()),
  );
}
