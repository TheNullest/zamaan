part of 'init_dependencies.imports.dart';

void initMappers() {
  sl.registerLazySingleton<UserMapper>(() => UserMapper());
  sl.registerLazySingleton<TaskMapper>(() => TaskMapper());
  sl.registerLazySingleton<SubTaskMapper>(() => SubTaskMapper());
  sl.registerLazySingleton<CategoryMapper>(() => CategoryMapper());
  sl.registerLazySingleton<GoalMapper>(() => GoalMapper());
  sl.registerLazySingleton<TagMapper>(() => TagMapper());
  sl.registerLazySingleton<CustomMeasurementUnitMapper>(() => CustomMeasurementUnitMapper());
  sl.registerLazySingleton<ScheduleConstraintsMapper>(() => ScheduleConstraintsMapper());
  sl.registerLazySingleton<ScheduledDayTimeMapper>(() => ScheduledDayTimeMapper());
  sl.registerLazySingleton<ScheduledIntervalMapper>(() => ScheduledIntervalMapper());
  sl.registerLazySingleton<ScheduledOccurrenceMapper>(() => ScheduledOccurrenceMapper());
  sl.registerLazySingleton<DateRangeMapper>(() => DateRangeMapper());
  sl.registerLazySingleton<TimeRangeMapper>(() => TimeRangeMapper());
  // sl.registerLazySingleton<TaskActivityMapper>(() => TaskActivityMapper());
}
