import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

part 'sub_task_hive_model.g.dart';

/// Hive model for sub-tasks.
///
/// Stores a sub‑task belonging to a parent task, including priority,
/// status, and cumulative spent time.
@HiveType(typeId: ClassHiveTypeIds.subTask) // 13
class SubTaskHiveModel extends BaseHiveOwnedModel {
  @HiveField(10)
  final String taskId;

  @HiveField(11)
  final Priority priority;

  @HiveField(12)
  final String title;

  @HiveField(13)
  final TaskStatus status;

  @HiveField(14)
  final Duration? totalSpentTime;

  SubTaskHiveModel({
    required super.id,
    required super.createdAt,
    required super.ownerId,
    required this.taskId,
    required this.priority,
    required this.title,
    required this.status,
    this.totalSpentTime,
    super.updatedAt,
    super.description,
    super.order,
    super.sharedWithUserIds,
  });

}
