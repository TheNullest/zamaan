part of "../init_dependencies.imports.dart";

void initHiveDataSources() {
  // ----- User -----
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserHiveLocalDataSourceImpl(box: sl<Box<UserHiveModel>>()),
  );

  // ----- Task -----
  sl.registerLazySingleton<TaskLocalDataSource<TaskHiveModel>>(
    () => TaskHiveLocalDataSourceImpl(box: sl<Box<TaskHiveModel>>()),
  );

  // ----- SubTask -----
  sl.registerLazySingleton<SubTaskLocalDataSource<SubTaskHiveModel>>(
    () => SubTaskHiveLocalDataSourceImpl(box: sl<Box<SubTaskHiveModel>>()),
  );

  // ----- Category -----
  sl.registerLazySingleton<CategoryLocalDataSource<CategoryHiveModel>>(
    () => CategoryHiveLocalDataSourceImpl(box: sl<Box<CategoryHiveModel>>()),
  );

  // ----- Goal -----
  sl.registerLazySingleton<GoalLocalDataSource<GoalHiveModel>>(
    () => GoalHiveLocalDataSourceImpl(box: sl<Box<GoalHiveModel>>()),
  );

  // ----- Tag -----
  sl.registerLazySingleton<TagLocalDataSource<TagHiveModel>>(
    () => TagHiveLocalDataSourceImpl(box: sl<Box<TagHiveModel>>()),
  );

  // ----- CustomMeasurementUnit -----
  sl.registerLazySingleton<CustomMeasurementUnitLocalDataSource<CustomMeasurementUnitHiveModel>>(
    () => CustomMeasurementUnitHiveLocalDataSourceImpl(
      box: sl<Box<CustomMeasurementUnitHiveModel>>(),
    ),
  );

  // ----- Scheduling -----
  sl.registerLazySingleton<ScheduleConstraintsLocalDataSource<ScheduleConstraintsHiveModel>>(
    () => ScheduleConstraintsHiveLocalDataSourceImpl(box: sl<Box<ScheduleConstraintsHiveModel>>()),
  );
  sl.registerLazySingleton<ScheduledDayTimeLocalDataSource<ScheduledDayTimeHiveModel>>(
    () => ScheduledDayTimeHiveLocalDataSourceImpl(box: sl<Box<ScheduledDayTimeHiveModel>>()),
  );
  sl.registerLazySingleton<ScheduledIntervalLocalDataSource<ScheduledIntervalHiveModel>>(
    () => ScheduledIntervalHiveLocalDataSourceImpl(box: sl<Box<ScheduledIntervalHiveModel>>()),
  );
  sl.registerLazySingleton<ScheduledOccurrenceLocalDataSource<ScheduledOccurrenceHiveModel>>(
    () => ScheduledOccurrenceHiveLocalDataSourceImpl(box: sl<Box<ScheduledOccurrenceHiveModel>>()),
  );
  sl.registerLazySingleton<DateRangeLocalDataSource<DateRangeHiveModel>>(
    () => DateRangeHiveLocalDataSourceImpl(box: sl<Box<DateRangeHiveModel>>()),
  );
  sl.registerLazySingleton<TimeRangeLocalDataSource<TimeRangeHiveModel>>(
    () => TimeRangeHiveLocalDataSourceImpl(box: sl<Box<TimeRangeHiveModel>>()),
  );

  // ----- Optional (uncomment when ready) -----
  // sl.registerLazySingleton<TaskActivityLocalDataSource>(
  //   () => TaskActivityHiveLocalDataSourceImpl(box: sl<Box<TaskActivityHiveModel>>()),
  // );
}
