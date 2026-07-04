import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/features/task_center/domain/entities/task/task.dart';
import 'package:zamaan/features/task_center/data/models/local/task/task_hive_model.dart';

class TaskMapper extends BaseDataMapper<TaskEntity, TaskHiveModel, void> {
  @override
  TaskHiveModel toLocalModel(TaskEntity entity) => TaskHiveModel(
    id: entity.id,
    createdAt: entity.createdAt,
    ownerId: entity.userId,
    title: entity.title,
    colorCode: entity.colorCode,
    iconCode: entity.iconCode,
    priority: entity.priority,
    categoryIds: entity.categoryIds,
    fixedTagIds: entity.fixedTagIds,
    totalSpentTime: entity.totalSpentTime,
    archived: entity.archived,
    taskStatus: entity.taskStatus,
    updatedAt: entity.updatedAt,
    description: entity.description,
    order: entity.order,
    sharedWithUserIds: const [],
  );

  @override
  void toRemoteModel(TaskEntity entity) {}

  @override
  TaskEntity toEntityFromLocal(TaskHiveModel model) => TaskEntity(
    id: model.id,
    userId: model.ownerId,
    createdAt: model.createdAt,
    title: model.title,
    colorCode: model.colorCode,
    iconCode: model.iconCode,
    priority: model.priority,
    categoryIds: model.categoryIds,
    fixedTagIds: model.fixedTagIds,
    totalSpentTime: model.totalSpentTime,
    archived: model.archived,
    taskStatus: model.taskStatus,
    description: model.description,
    updatedAt: model.updatedAt,
    order: model.order,
  );

  @override
  TaskEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
