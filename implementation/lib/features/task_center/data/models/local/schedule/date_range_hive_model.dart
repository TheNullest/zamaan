// lib/features/task_center/data/models/local/date_range_hive_model.dart

import 'package:hive_ce/hive.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';

part 'date_range_hive_model.g.dart';

/// Hive model for date ranges.
///
/// Stores a date‑time range (start/end) belonging to a parent entity.
@HiveType(typeId: ClassHiveTypeIds.dateRange) // 23
class DateRangeHiveModel extends BaseHiveOwnedModel {
  @HiveField(10)
  final String parentId;

  @HiveField(11)
  final DateTime? startDate;

  @HiveField(12)
  final DateTime? endDate;

  DateRangeHiveModel({
    required super.id,
    required super.createdAt,
    required super.ownerId,
    required this.parentId,
    this.startDate,
    this.endDate,
    super.updatedAt,
    super.description,
    super.order,
    super.sharedWithUserIds,
  });

}
