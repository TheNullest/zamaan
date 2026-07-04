import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_interval.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/scheduled_interval_hive_model.dart';

class ScheduledIntervalMapper
    extends BaseDataMapper<ScheduledIntervalEntity, ScheduledIntervalHiveModel, void> {
  @override
  ScheduledIntervalHiveModel toLocalModel(ScheduledIntervalEntity entity) =>
      ScheduledIntervalHiveModel(
        id: entity.id,
        createdAt: entity.createdAt,
        ownerId: entity.userId,
        taskId: entity.taskId,
        intervalUnit: entity.intervalUnit,
        intervalValue: entity.intervalValue,
        repeatCount: entity.repeatCount,
        scheduledTimeIds: entity.scheduledTimeIds,
        startDate: entity.startDate,
        consecutiveOccurrences: entity.consecutiveOccurrences,
        updatedAt: entity.updatedAt,
        description: entity.description,
        order: entity.order,
        sharedWithUserIds: const [],
      );

  @override
  void toRemoteModel(ScheduledIntervalEntity entity) {}

  @override
  ScheduledIntervalEntity toEntityFromLocal(ScheduledIntervalHiveModel model) =>
      ScheduledIntervalEntity(
        id: model.id,
        userId: model.ownerId,
        createdAt: model.createdAt,
        taskId: model.taskId,
        intervalUnit: model.intervalUnit,
        intervalValue: model.intervalValue,
        repeatCount: model.repeatCount ?? 0,
        scheduledTimeIds: model.scheduledTimeIds,
        startDate: model.startDate,
        consecutiveOccurrences: model.consecutiveOccurrences,
        description: model.description,
        updatedAt: model.updatedAt,
        order: model.order,
      );

  @override
  ScheduledIntervalEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
