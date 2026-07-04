import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/features/task_center/domain/entities/task/sub_task.dart';
import 'package:zamaan/features/task_center/data/models/local/task/sub_task_hive_model.dart';

class SubTaskMapper extends BaseDataMapper<SubTaskEntity, SubTaskHiveModel, void> {
  @override
  SubTaskHiveModel toLocalModel(SubTaskEntity entity) => SubTaskHiveModel(
    id: entity.id,
    createdAt: entity.createdAt,
    ownerId: entity.userId,
    taskId: entity.taskId,
    priority: entity.priority,
    title: entity.title,
    status: entity.status,
    totalSpentTime: entity.totalSpentTime,
    updatedAt: entity.updatedAt,
    description: entity.description,
    order: entity.order,
    sharedWithUserIds: const [],
  );

  @override
  void toRemoteModel(SubTaskEntity entity) {}

  @override
  SubTaskEntity toEntityFromLocal(SubTaskHiveModel model) => SubTaskEntity(
    id: model.id,
    userId: model.ownerId,
    createdAt: model.createdAt,
    taskId: model.taskId,
    priority: model.priority,
    title: model.title,
    status: model.status,
    totalSpentTime: model.totalSpentTime,
    description: model.description,
    updatedAt: model.updatedAt,
    order: model.order,
  );

  @override
  SubTaskEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
