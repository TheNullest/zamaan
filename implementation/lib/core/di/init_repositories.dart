part of 'init_dependencies.imports.dart';

void initRepositories() {
  // ----- Task Repository -----
  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(
      localDataSource: sl<TaskLocalDataSource<TaskHiveModel>>(),
      dataMapper: sl<TaskMapper>(),
      currentUserProvider: sl<CurrentUserProvider>(),
    ),
  );

  // ----- SubTask Repository -----
  sl.registerLazySingleton<SubTaskRepository>(
    () => SubTaskRepositoryImpl(
      localDataSource: sl<SubTaskLocalDataSource<SubTaskHiveModel>>(),
      dataMapper: sl<SubTaskMapper>(),
      currentUserProvider: sl<CurrentUserProvider>(),
    ),
  );

  // ----- Category Repository -----
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(
      localDataSource: sl<CategoryLocalDataSource<CategoryHiveModel>>(),
      dataMapper: sl<CategoryMapper>(),
      currentUserProvider: sl<CurrentUserProvider>(),
    ),
  );

  // ----- Goal Repository -----
  sl.registerLazySingleton<GoalRepository>(
    () => GoalRepositoryImpl(
      localDataSource: sl<GoalLocalDataSource<GoalHiveModel>>(),
      dataMapper: sl<GoalMapper>(),
      currentUserProvider: sl<CurrentUserProvider>(),
    ),
  );

  // ----- Tag Repository -----
  sl.registerLazySingleton<TagRepository>(
    () => TagRepositoryImpl(
      localDataSource: sl<TagLocalDataSource<TagHiveModel>>(),
      dataMapper: sl<TagMapper>(),
      currentUserProvider: sl<CurrentUserProvider>(),
    ),
  );

  // ----- CustomMeasurementUnit Repository -----
  sl.registerLazySingleton<CustomMeasurementUnitRepository>(
    () => CustomMeasurementUnitRepositoryImpl(
      localDataSource: sl<CustomMeasurementUnitLocalDataSource<CustomMeasurementUnitHiveModel>>(),
      dataMapper: sl<CustomMeasurementUnitMapper>(),
      currentUserProvider: sl<CurrentUserProvider>(),
    ),
  );

  // ----- Scheduling Repositories -----
  sl.registerLazySingleton<ScheduleConstraintsRepository>(
    () => ScheduleConstraintsRepositoryImpl(
      localDataSource: sl<ScheduleConstraintsLocalDataSource<ScheduleConstraintsHiveModel>>(),
      dataMapper: sl<ScheduleConstraintsMapper>(),
      currentUserProvider: sl<CurrentUserProvider>(),
    ),
  );
  sl.registerLazySingleton<ScheduledDayTimeRepository>(
    () => ScheduledDayTimeRepositoryImpl(
      localDataSource: sl<ScheduledDayTimeLocalDataSource<ScheduledDayTimeHiveModel>>(),
      dataMapper: sl<ScheduledDayTimeMapper>(),
      currentUserProvider: sl<CurrentUserProvider>(),
    ),
  );
  sl.registerLazySingleton<ScheduledIntervalRepository>(
    () => ScheduledIntervalRepositoryImpl(
      localDataSource: sl<ScheduledIntervalLocalDataSource<ScheduledIntervalHiveModel>>(),
      dataMapper: sl<ScheduledIntervalMapper>(),
      currentUserProvider: sl<CurrentUserProvider>(),
    ),
  );
  sl.registerLazySingleton<ScheduledOccurrenceRepository>(
    () => ScheduledOccurrenceRepositoryImpl(
      localDataSource: sl<ScheduledOccurrenceLocalDataSource<ScheduledOccurrenceHiveModel>>(),
      dataMapper: sl<ScheduledOccurrenceMapper>(),
      currentUserProvider: sl<CurrentUserProvider>(),
    ),
  );
  sl.registerLazySingleton<DateRangeRepository>(
    () => DateRangeRepositoryImpl(
      localDataSource: sl<DateRangeLocalDataSource<DateRangeHiveModel>>(),
      dataMapper: sl<DateRangeMapper>(),
      currentUserProvider: sl<CurrentUserProvider>(),
    ),
  );
  sl.registerLazySingleton<TimeRangeRepository>(
    () => TimeRangeRepositoryImpl(
      localDataSource: sl<TimeRangeLocalDataSource<TimeRangeHiveModel>>(),
      dataMapper: sl<TimeRangeMapper>(),
      currentUserProvider: sl<CurrentUserProvider>(),
    ),
  );

  // ----- Optional (uncomment when ready) -----
  // sl.registerLazySingleton<TaskActivityRepository>(
  //   () => TaskActivityRepositoryImpl(
  //     localDataSource: sl<TaskActivityLocalDataSource>(),
  //     dataMapper: sl<TaskActivityMapper>(),
  //     currentUserProvider: sl<CurrentUserProvider>(),
  //   ),
  // );

  // ----- Auth User Datasource -----
  sl.registerLazySingleton<AuthUserLocalDataSource>(
    () => AuthUserHiveLocalDataSourceImpl(userLocalDataSource: sl<UserLocalDataSource>()),
  );

  // ----- Auth User Repository -----
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(dataSource: sl<AuthUserLocalDataSource>(), mapper: sl<UserMapper>()),
  );
}
