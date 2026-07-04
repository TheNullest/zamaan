// lib/features/task_center/data/models/local/tag_hive_model.dart

import 'package:hive_ce/hive.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';

part 'tag_hive_model.g.dart';

/// Hive model for tags.
///
/// Stores a visual tag (name, colour, icon) used to organise tasks.
@HiveType(typeId: ClassHiveTypeIds.tag) // 21
class TagHiveModel extends BaseHiveOwnedModel {
  @HiveField(10)
  final String title;

  @HiveField(11)
  final int colorCode;

  @HiveField(12)
  final int iconCode;

  @HiveField(13)
  final String? taskId;

  TagHiveModel({
    required super.id,
    required super.createdAt,
    required super.ownerId,
    required this.title,
    required this.colorCode,
    required this.iconCode,
    this.taskId,
    super.updatedAt,
    super.description,
    super.order,
    super.sharedWithUserIds,
  });
}
