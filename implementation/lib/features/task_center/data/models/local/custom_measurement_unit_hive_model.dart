// lib/features/task_center/data/models/local/custom_measurement_unit_hive_model.dart

import 'package:hive_ce/hive.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';

part 'custom_measurement_unit_hive_model.g.dart';

/// Hive model for custom measurement units.
///
/// Stores user‑defined units of measurement (e.g., "pages", "cups").
@HiveType(typeId: ClassHiveTypeIds.customMeasurementUnit) // 16
class CustomMeasurementUnitHiveModel extends BaseHiveOwnedModel {
  @HiveField(10)
  final String title;

  @HiveField(11)
  final bool isDouble;

  @HiveField(12)
  final int iconCode;

  CustomMeasurementUnitHiveModel({
    required super.id,
    required super.createdAt,
    required super.ownerId,
    required this.title,
    required this.isDouble,
    required this.iconCode,
    super.updatedAt,
    super.description,
    super.order,
    super.sharedWithUserIds,
  });

}
