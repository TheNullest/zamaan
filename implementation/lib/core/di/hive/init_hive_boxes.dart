part of '../init_dependencies.imports.dart';

void initHiveBoxes() {
  // User box
  sl.registerLazySingleton<Box<UserHiveModel>>(() => Hive.box<UserHiveModel>(HiveBoxNames.users));

  // Task & SubTask
  sl.registerLazySingleton<Box<TaskHiveModel>>(() => Hive.box<TaskHiveModel>(HiveBoxNames.tasks));
  sl.registerLazySingleton<Box<SubTaskHiveModel>>(
    () => Hive.box<SubTaskHiveModel>(HiveBoxNames.subTasks),
  );

  // Core data models
  sl.registerLazySingleton<Box<CategoryHiveModel>>(
    () => Hive.box<CategoryHiveModel>(HiveBoxNames.categories),
  );
  sl.registerLazySingleton<Box<GoalHiveModel>>(() => Hive.box<GoalHiveModel>(HiveBoxNames.goals));
  sl.registerLazySingleton<Box<TagHiveModel>>(() => Hive.box<TagHiveModel>(HiveBoxNames.tags));
  sl.registerLazySingleton<Box<CustomMeasurementUnitHiveModel>>(
    () => Hive.box<CustomMeasurementUnitHiveModel>(HiveBoxNames.customMeasurementUnits),
  );

  // Scheduling models
  sl.registerLazySingleton<Box<ScheduleConstraintsHiveModel>>(
    () => Hive.box<ScheduleConstraintsHiveModel>(HiveBoxNames.scheduleConstraints),
  );
  sl.registerLazySingleton<Box<ScheduledDayTimeHiveModel>>(
    () => Hive.box<ScheduledDayTimeHiveModel>(HiveBoxNames.scheduledDayTimes),
  );
  sl.registerLazySingleton<Box<ScheduledIntervalHiveModel>>(
    () => Hive.box<ScheduledIntervalHiveModel>(HiveBoxNames.scheduledIntervals),
  );
  sl.registerLazySingleton<Box<ScheduledOccurrenceHiveModel>>(
    () => Hive.box<ScheduledOccurrenceHiveModel>(HiveBoxNames.scheduledOccurrences),
  );
  sl.registerLazySingleton<Box<DateRangeHiveModel>>(
    () => Hive.box<DateRangeHiveModel>(HiveBoxNames.dateRanges),
  );
  sl.registerLazySingleton<Box<TimeRangeHiveModel>>(
    () => Hive.box<TimeRangeHiveModel>(HiveBoxNames.timeRanges),
  );

  // Optional / future boxes (uncomment when models are ready)
  // sl.registerLazySingleton<Box<TaskActivityHiveModel>>(
  //   () => Hive.box<TaskActivityHiveModel>(HiveBoxNames.taskActivities),
  // );
  // sl.registerLazySingleton<Box<UserHiveModel>>(
  //   () => Hive.box<UserHiveModel>(HiveBoxNames.users),
  // );
  // sl.registerLazySingleton<Box<DeviceHiveModel>>(
  //   () => Hive.box<DeviceHiveModel>(HiveBoxNames.devices),
  // );
  // sl.registerLazySingleton<Box<LogHiveModel>>(
  //   () => Hive.box<LogHiveModel>(HiveBoxNames.logs),
  // );
  // sl.registerLazySingleton<Box<SyncLogHiveModel>>(
  //   () => Hive.box<SyncLogHiveModel>(HiveBoxNames.syncLogs),
  // );
}
