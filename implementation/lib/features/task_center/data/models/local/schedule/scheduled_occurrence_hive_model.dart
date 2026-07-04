// lib/features/task_center/data/models/local/scheduled_occurrence_hive_model.dart

import 'package:hive_ce/hive.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

part 'scheduled_occurrence_hive_model.g.dart';

/// Hive model for scheduled occurrences.
///
/// Represents a concrete scheduled instance of a task, with start/end times,
/// status, progress, and scheduling rule reference.
@HiveType(typeId: ClassHiveTypeIds.scheduledOccurrence) // 20
class ScheduledOccurrenceHiveModel extends BaseHiveOwnedModel {
  @HiveField(10)
  final String taskId;

  @HiveField(11)
  final DateTime startDateTime;

  @HiveField(12)
  final DateTime endDateTime;

  @HiveField(13)
  final String schedulerId;

  @HiveField(14)
  final ScheduleType schedulerType;

  @HiveField(15)
  final OccurrenceStatus occurrenceStatus;

  @HiveField(16)
  final int sequenceNumber;

  @HiveField(17)
  final int successPercentage;

  @HiveField(18)
  final String timezone;

  @HiveField(19)
  final ScheduledTimeMode timeMode;

  ScheduledOccurrenceHiveModel({
    required super.id,
    required super.createdAt,
    required super.ownerId,
    required this.taskId,
    required this.startDateTime,
    required this.endDateTime,
    required this.schedulerId,
    required this.schedulerType,
    required this.occurrenceStatus,
    required this.sequenceNumber,
    required this.successPercentage,
    required this.timezone,
    required this.timeMode,
    super.updatedAt,
    super.description,
    super.order,
    super.sharedWithUserIds,
  });

}
