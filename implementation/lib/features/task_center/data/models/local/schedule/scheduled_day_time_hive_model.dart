// lib/features/task_center/data/models/local/scheduled_day_time_hive_model.dart

import 'package:hive_ce/hive.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

part 'scheduled_day_time_hive_model.g.dart';

/// Hive model for scheduled day/time rules.
///
/// Defines repeating day‑of‑week or day‑of‑month patterns with time windows.
@HiveType(typeId: ClassHiveTypeIds.scheduledDayTime) // 18
class ScheduledDayTimeHiveModel extends BaseHiveOwnedModel {
  @HiveField(10)
  final String taskId;

  @HiveField(11)
  final DayType dayType;

  @HiveField(12)
  final String dayLabel;

  @HiveField(13)
  final ScheduledTimeMode timeMode;

  @HiveField(14)
  final int repeatCount;

  @HiveField(15)
  final int startTime; // minutes from midnight

  @HiveField(16)
  final int endTime; // minutes from midnight

  ScheduledDayTimeHiveModel({
    required super.id,
    required super.createdAt,
    required super.ownerId,
    required this.taskId,
    required this.dayType,
    required this.dayLabel,
    required this.timeMode,
    required this.repeatCount,
    required this.startTime,
    required this.endTime,
    super.updatedAt,
    super.description,
    super.order,
    super.sharedWithUserIds,
  });

}
