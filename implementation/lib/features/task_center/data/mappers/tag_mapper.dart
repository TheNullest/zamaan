import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/features/task_center/domain/entities/tag.dart';
import 'package:zamaan/features/task_center/data/models/local/tag_hive_model.dart';

class TagMapper extends BaseDataMapper<TagEntity, TagHiveModel, void> {
  @override
  TagHiveModel toLocalModel(TagEntity entity) => TagHiveModel(
    id: entity.id,
    createdAt: entity.createdAt,
    ownerId: entity.userId,
    taskId: entity.taskId,
    title: entity.title,
    colorCode: entity.colorCode,
    iconCode: entity.iconCode,
    updatedAt: entity.updatedAt,
    description: entity.description,
    order: entity.order,
    sharedWithUserIds: const [],
  );

  @override
  void toRemoteModel(TagEntity entity) {}

  @override
  TagEntity toEntityFromLocal(TagHiveModel model) => TagEntity(
    id: model.id,
    userId: model.ownerId,
    taskId: model.taskId,
    createdAt: model.createdAt,
    title: model.title,
    colorCode: model.colorCode,
    iconCode: model.iconCode,
    description: model.description,
    updatedAt: model.updatedAt,
    order: model.order,
  );

  @override
  TagEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
