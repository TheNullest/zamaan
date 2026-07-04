import 'package:hive_ce/hive_ce.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

part 'task_hive_model.g.dart';

/// Hive model for tasks.
///
/// Stores all task fields, including colour, icon, priority, categories,
/// tags, time tracking, and status.
@HiveType(typeId: ClassHiveTypeIds.task) // 12
class TaskHiveModel extends BaseHiveOwnedModel {
  @HiveField(10)
  final String title;

  @HiveField(11)
  final int colorCode;

  @HiveField(12)
  final int iconCode;

  @HiveField(13)
  final Priority priority;

  @HiveField(14)
  final List<String> categoryIds;

  @HiveField(15)
  final List<String> fixedTagIds;

  @HiveField(16)
  final Duration totalSpentTime;

  @HiveField(17)
  final bool archived;

  @HiveField(18)
  final TaskStatus taskStatus;

  TaskHiveModel({
    required super.id,
    required super.createdAt,
    required super.ownerId,
    required this.title,
    required this.colorCode,
    required this.iconCode,
    required this.priority,
    required this.categoryIds,
    required this.fixedTagIds,
    required this.totalSpentTime,
    required this.archived,
    required this.taskStatus,
    super.updatedAt,
    super.description,
    super.order,
    super.sharedWithUserIds,
  });
}
