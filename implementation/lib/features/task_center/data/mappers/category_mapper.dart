import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/features/task_center/domain/entities/category.dart';
import 'package:zamaan/features/task_center/data/models/local/category_hive_model.dart';

class CategoryMapper extends BaseDataMapper<CategoryEntity, CategoryHiveModel, void> {
  @override
  CategoryHiveModel toLocalModel(CategoryEntity entity) => CategoryHiveModel(
    id: entity.id,
    createdAt: entity.createdAt,
    ownerId: entity.userId,
    title: entity.title,
    colorCode: entity.colorCode,
    iconCode: entity.iconCode,
    updatedAt: entity.updatedAt,
    description: entity.description,
    order: entity.order,
    sharedWithUserIds: const [],
  );

  @override
  void toRemoteModel(CategoryEntity entity) {}

  @override
  CategoryEntity toEntityFromLocal(CategoryHiveModel model) => CategoryEntity(
    id: model.id,
    userId: model.ownerId,
    createdAt: model.createdAt,
    title: model.title,
    colorCode: model.colorCode,
    iconCode: model.iconCode,
    description: model.description,
    updatedAt: model.updatedAt,
    order: model.order,
  );

  @override
  CategoryEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
