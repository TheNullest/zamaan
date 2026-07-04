import 'package:hive_ce/hive_ce.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';

part 'category_hive_model.g.dart';

/// Hive model for categories.
///
/// Stores a visual category (name, colour, icon) used to organise tasks.
@HiveType(typeId: ClassHiveTypeIds.category) // 14
class CategoryHiveModel extends BaseHiveOwnedModel {
  @HiveField(10)
  final String title;

  @HiveField(11)
  final int colorCode;

  @HiveField(12)
  final int iconCode;

  CategoryHiveModel({
    required super.id,
    required super.createdAt,
    required super.ownerId,
    required this.title,
    required this.colorCode,
    required this.iconCode,
    super.updatedAt,
    super.description,
    super.order,
    super.sharedWithUserIds,
  });

}
