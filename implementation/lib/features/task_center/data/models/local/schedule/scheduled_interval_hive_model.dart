// lib/features/task_center/data/models/local/scheduled_interval_hive_model.dart

import 'package:hive_ce/hive.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';
import 'package:zamaan/shared/domain/enums/hive/interval_unit.dart';

part 'scheduled_interval_hive_model.g.dart';

/// Hive model for scheduled interval rules.
///
/// Defines interval‑based repetition (e.g., every 3 days) with time ranges.
@HiveType(typeId: ClassHiveTypeIds.scheduledInterval) // 19
class ScheduledIntervalHiveModel extends BaseHiveOwnedModel {
  @HiveField(10)
  final String taskId;

  @HiveField(11)
  final IntervalUnit intervalUnit;

  @HiveField(12)
  final double intervalValue;

  @HiveField(13)
  final int? repeatCount;

  @HiveField(14)
  final List<String> scheduledTimeIds; // IDs of TimeRangeEntity

  @HiveField(15)
  final DateTime startDate;

  @HiveField(16)
  final int consecutiveOccurrences;

  ScheduledIntervalHiveModel({
    required super.id,
    required super.createdAt,
    required super.ownerId,
    required this.taskId,
    required this.intervalUnit,
    required this.intervalValue,
    required this.repeatCount,
    required this.scheduledTimeIds,
    required this.startDate,
    required this.consecutiveOccurrences,
    super.updatedAt,
    super.description,
    super.order,
    super.sharedWithUserIds,
  });

}
