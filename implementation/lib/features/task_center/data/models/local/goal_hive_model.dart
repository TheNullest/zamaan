// lib/features/task_center/data/models/local/goal_hive_model.dart

import 'package:hive_ce/hive.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

part 'goal_hive_model.g.dart';

/// Hive model for goals.
///
/// Stores measurable targets for tasks/subtasks with constraints and progress.
@HiveType(typeId: ClassHiveTypeIds.goal) // 15
class GoalHiveModel extends BaseHiveOwnedModel {
  @HiveField(10)
  final ReferenceType refType;

  @HiveField(11)
  final String refId;

  @HiveField(12)
  final MeasurementUnit measurementUnit;

  @HiveField(13)
  final GoalConstraint goalConstraint;

  @HiveField(14)
  final String? customMeasurementUnitId;

  // RepetitionType index (int) -> target value (num, Range, etc.)
  @HiveField(15)
  final Map<int, dynamic> goalTargets;

  GoalHiveModel({
    required super.id,
    required super.createdAt,
    required super.ownerId,
    required this.refType,
    required this.refId,
    required this.measurementUnit,
    required this.goalConstraint,
    this.customMeasurementUnitId,
    required this.goalTargets,
    super.updatedAt,
    super.description,
    super.order,
    super.sharedWithUserIds,
  });

}
