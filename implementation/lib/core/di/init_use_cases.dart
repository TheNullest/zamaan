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

  sl.registerLazySingleton<CreateScheduleConstraintsUseCase>(
    () => CreateScheduleConstraintsUseCase(sl<ScheduleConstraintsRepository>()),
  );
  sl.registerLazySingleton<GetScheduleConstraintsForTaskUseCase>(
    () => GetScheduleConstraintsForTaskUseCase(sl<ScheduleConstraintsRepository>()),
  );
  sl.registerLazySingleton<UpdateScheduleConstraintsUseCase>(
    () => UpdateScheduleConstraintsUseCase(sl<ScheduleConstraintsRepository>()),
  );
  sl.registerLazySingleton<DeleteScheduleConstraintsUseCase>(
    () => DeleteScheduleConstraintsUseCase(sl<ScheduleConstraintsRepository>()),
  );

  sl.registerLazySingleton<CreateScheduledDayTimeUseCase>(
    () => CreateScheduledDayTimeUseCase(sl<ScheduledDayTimeRepository>()),
  );
  sl.registerLazySingleton<GetScheduledDayTimesForTaskUseCase>(
    () => GetScheduledDayTimesForTaskUseCase(sl<ScheduledDayTimeRepository>()),
  );
  sl.registerLazySingleton<UpdateScheduledDayTimeUseCase>(
    () => UpdateScheduledDayTimeUseCase(sl<ScheduledDayTimeRepository>()),
  );
  sl.registerLazySingleton<DeleteScheduledDayTimeUseCase>(
    () => DeleteScheduledDayTimeUseCase(sl<ScheduledDayTimeRepository>()),
  );

  sl.registerLazySingleton<CreateScheduledIntervalUseCase>(
    () => CreateScheduledIntervalUseCase(sl<ScheduledIntervalRepository>()),
  );
  sl.registerLazySingleton<GetScheduledIntervalsForTaskUseCase>(
    () => GetScheduledIntervalsForTaskUseCase(sl<ScheduledIntervalRepository>()),
  );
  sl.registerLazySingleton<UpdateScheduledIntervalUseCase>(
    () => UpdateScheduledIntervalUseCase(sl<ScheduledIntervalRepository>()),
  );
  sl.registerLazySingleton<DeleteScheduledIntervalUseCase>(
    () => DeleteScheduledIntervalUseCase(sl<ScheduledIntervalRepository>()),
  );

  sl.registerLazySingleton<CreateScheduledOccurrenceUseCase>(
    () => CreateScheduledOccurrenceUseCase(sl<ScheduledOccurrenceRepository>()),
  );
  sl.registerLazySingleton<GetScheduledOccurrencesForTaskUseCase>(
    () => GetScheduledOccurrencesForTaskUseCase(sl<ScheduledOccurrenceRepository>()),
  );
  sl.registerLazySingleton<UpdateScheduledOccurrenceUseCase>(
    () => UpdateScheduledOccurrenceUseCase(sl<ScheduledOccurrenceRepository>()),
  );
  sl.registerLazySingleton<DeleteScheduledOccurrenceUseCase>(
    () => DeleteScheduledOccurrenceUseCase(sl<ScheduledOccurrenceRepository>()),
  );

  sl.registerLazySingleton<CreateDateRangeUseCase>(
    () => CreateDateRangeUseCase(sl<DateRangeRepository>()),
  );
  sl.registerLazySingleton<GetDateRangesForParentUseCase>(
    () => GetDateRangesForParentUseCase(sl<DateRangeRepository>()),
  );
  sl.registerLazySingleton<UpdateDateRangeUseCase>(
    () => UpdateDateRangeUseCase(sl<DateRangeRepository>()),
  );
  sl.registerLazySingleton<DeleteDateRangeUseCase>(
    () => DeleteDateRangeUseCase(sl<DateRangeRepository>()),
  );

  sl.registerLazySingleton<CreateTimeRangeUseCase>(
    () => CreateTimeRangeUseCase(sl<TimeRangeRepository>()),
  );
  sl.registerLazySingleton<GetTimeRangesForParentUseCase>(
    () => GetTimeRangesForParentUseCase(sl<TimeRangeRepository>()),
  );
  sl.registerLazySingleton<UpdateTimeRangeUseCase>(
    () => UpdateTimeRangeUseCase(sl<TimeRangeRepository>()),
  );
  sl.registerLazySingleton<DeleteTimeRangeUseCase>(
    () => DeleteTimeRangeUseCase(sl<TimeRangeRepository>()),
  );
}
