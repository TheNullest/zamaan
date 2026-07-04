// lib/features/task_center/data/models/local/time_range_hive_model.dart

import 'package:hive_ce/hive.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';

part 'time_range_hive_model.g.dart';

/// Hive model for time ranges.
///
/// Stores a time‑of‑day range (start/end in minutes from midnight) for a parent entity.
@HiveType(typeId: ClassHiveTypeIds.timeRange) // 24
class TimeRangeHiveModel extends BaseHiveOwnedModel {
  @HiveField(10)
  final String parentId;

  @HiveField(11)
  final int start; // minutes from midnight (0‑1440)

  @HiveField(12)
  final int end; // minutes from midnight (0‑1440)

  TimeRangeHiveModel({
    required super.id,
    required super.createdAt,
    required super.ownerId,
    required this.parentId,
    required this.start,
    required this.end,
    super.updatedAt,
    super.description,
    super.order,
    super.sharedWithUserIds,
  });

}
