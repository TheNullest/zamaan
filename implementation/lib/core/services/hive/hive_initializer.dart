// lib/core/hive/hive_initializer.dart

// --- Model adapters (from your original list) ---
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zamaan/core/constants/hive_boxes.dart';
import 'package:zamaan/features/task_center/data/models/local/category_hive_model.dart';
import 'package:zamaan/features/task_center/data/models/local/goal_hive_model.dart';
import 'package:zamaan/features/task_center/data/models/local/custom_measurement_unit_hive_model.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/date_range_hive_model.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/schedule_constraints_hive_model.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/scheduled_day_time_hive_model.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/scheduled_interval_hive_model.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/scheduled_occurrence_hive_model.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/time_range_hive_model.dart';

import 'package:zamaan/features/task_center/data/models/local/tag_hive_model.dart';
import 'package:zamaan/features/task_center/data/models/local/task/sub_task_hive_model.dart';
import 'package:zamaan/features/task_center/data/models/local/task/task_hive_model.dart';
import 'package:zamaan/shared/data/models/local/user/user_hive_model.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';
// Uncomment when TaskActivity is ready:
// import 'package:zamaan/features/task_center/data/models/local/task_activity_hive_model.dart';
// import 'package:zamaan/features/sync/data/models/sync_log_hive_model.dart';

/// Centralised Hive initialisation.
/// Registers all adapters and opens all boxes.
class HiveInitializer {
  /// Call this once at app startup.
  /// Provide an [encryptionCipher] only if you need encrypted boxes.
  static Future<void> init({HiveCipher? encryptionCipher}) async {
    final appDir = await getApplicationDocumentsDirectory();
    Hive.init(appDir.path);

    _registerAdapters();
    await _openAllBoxes(encryptionCipher);
  }

  static void _registerAdapters() {
    // ---------- Model adapters ----------
    Hive.registerAdapter(UserHiveModelAdapter());
    Hive.registerAdapter(TaskHiveModelAdapter());
    Hive.registerAdapter(SubTaskHiveModelAdapter());
    Hive.registerAdapter(CategoryHiveModelAdapter());
    Hive.registerAdapter(GoalHiveModelAdapter());
    Hive.registerAdapter(CustomMeasurementUnitHiveModelAdapter());
    Hive.registerAdapter(ScheduleConstraintsHiveModelAdapter());
    Hive.registerAdapter(ScheduledDayTimeHiveModelAdapter());
    Hive.registerAdapter(ScheduledIntervalHiveModelAdapter());
    Hive.registerAdapter(ScheduledOccurrenceHiveModelAdapter());
    Hive.registerAdapter(DateRangeHiveModelAdapter());
    Hive.registerAdapter(TimeRangeHiveModelAdapter());
    Hive.registerAdapter(TagHiveModelAdapter());

    // Optional (uncomment when ready):
    // Hive.registerAdapter(TaskActivityHiveModelAdapter());
    // Hive.registerAdapter(SyncLogHiveModelAdapter());

    // ---------- Enum adapters ----------
    Hive.registerAdapter(DayTypeAdapter());
    Hive.registerAdapter(GoalConstraintAdapter());
    Hive.registerAdapter(IntervalUnitAdapter());
    Hive.registerAdapter(MeasurementCategoryAdapter());
    Hive.registerAdapter(MeasurementUnitAdapter());
    Hive.registerAdapter(OSAdapter());
    Hive.registerAdapter(PriorityAdapter());
    Hive.registerAdapter(ReferenceTypeAdapter());
    Hive.registerAdapter(RepetitionTypeAdapter());
    Hive.registerAdapter(ScheduleTypeAdapter());
    Hive.registerAdapter(SyncActionAdapter());
    Hive.registerAdapter(TaskStatusAdapter());
    Hive.registerAdapter(OccurrenceStatusAdapter());
    Hive.registerAdapter(WeekDayAdapter());
    Hive.registerAdapter(ScheduledTimeModeAdapter());

    // ---------- Dart core type adapters ----------
    // Hive.registerAdapter(DurationAdapter());
  }

  static Future<void> _openAllBoxes(HiveCipher? cipher) async {
    // Open each box using the corresponding HiveBoxNames constant.
    // All boxes are opened with the correct model type.
    await Hive.openBox<UserHiveModel>(HiveBoxNames.users, encryptionCipher: cipher);
    await Hive.openBox<TaskHiveModel>(HiveBoxNames.tasks, encryptionCipher: cipher);
    await Hive.openBox<SubTaskHiveModel>(HiveBoxNames.subTasks, encryptionCipher: cipher);
    await Hive.openBox<CategoryHiveModel>(HiveBoxNames.categories, encryptionCipher: cipher);
    await Hive.openBox<GoalHiveModel>(HiveBoxNames.goals, encryptionCipher: cipher);
    await Hive.openBox<CustomMeasurementUnitHiveModel>(
      HiveBoxNames.customMeasurementUnits,
      encryptionCipher: cipher,
    );
    await Hive.openBox<ScheduleConstraintsHiveModel>(
      HiveBoxNames.scheduleConstraints,
      encryptionCipher: cipher,
    );
    await Hive.openBox<ScheduledDayTimeHiveModel>(
      HiveBoxNames.scheduledDayTimes,
      encryptionCipher: cipher,
    );
    await Hive.openBox<ScheduledIntervalHiveModel>(
      HiveBoxNames.scheduledIntervals,
      encryptionCipher: cipher,
    );
    await Hive.openBox<ScheduledOccurrenceHiveModel>(
      HiveBoxNames.scheduledOccurrences,
      encryptionCipher: cipher,
    );
    await Hive.openBox<DateRangeHiveModel>(HiveBoxNames.dateRanges, encryptionCipher: cipher);
    await Hive.openBox<TimeRangeHiveModel>(HiveBoxNames.timeRanges, encryptionCipher: cipher);
    await Hive.openBox<TagHiveModel>(HiveBoxNames.tags, encryptionCipher: cipher);

    // Optional boxes (uncomment when needed):
    // await Hive.openBox<TaskActivityHiveModel>(HiveBoxNames.taskActivities, encryptionCipher: cipher);
    // await Hive.openBox<SyncLogHiveModel>(HiveBoxNames.syncLogs, encryptionCipher: cipher);
    // await Hive.openBox<DeviceHiveModel>(HiveBoxNames.devices, encryptionCipher: cipher);
    // await Hive.openBox<LogHiveModel>(HiveBoxNames.logs, encryptionCipher: cipher);
  }
}
