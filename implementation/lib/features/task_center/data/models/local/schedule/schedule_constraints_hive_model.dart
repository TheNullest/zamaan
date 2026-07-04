// lib/features/task_center/data/models/local/schedule_constraints_hive_model.dart

import 'package:hive_ce/hive.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';

part 'schedule_constraints_hive_model.g.dart';

/// Hive model for schedule constraints.
///
/// Defines constraints (date ranges, exception dates/days) that restrict
/// when a scheduled task can occur.
@HiveType(typeId: ClassHiveTypeIds.scheduleConstraints) // 17
class ScheduleConstraintsHiveModel extends BaseHiveOwnedModel {
  @HiveField(10)
  final String taskId;

  @HiveField(11)
  final DateTime? startDate;

  @HiveField(12)
  final DateTime? endDate;

  @HiveField(13)
  final List<DateTime> exceptionDates;

  @HiveField(14)
  final List<int> exceptionWeekDays; // store WeekDay enum index

  @HiveField(15)
  final List<int> exceptionMonthDays;

  @HiveField(16)
  final bool enforceScheduleBounds;

  ScheduleConstraintsHiveModel({
    required super.id,
    required super.createdAt,
    required super.ownerId,
    required this.taskId,
    this.startDate,
    this.endDate,
    required this.exceptionDates,
    required this.exceptionWeekDays,
    required this.exceptionMonthDays,
    required this.enforceScheduleBounds,
    super.updatedAt,
    super.description,
    super.order,
    super.sharedWithUserIds,
  });

}
