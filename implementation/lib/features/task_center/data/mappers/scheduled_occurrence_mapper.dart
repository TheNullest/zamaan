import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_occurrence.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/scheduled_occurrence_hive_model.dart';

class ScheduledOccurrenceMapper
    extends BaseDataMapper<ScheduledOccurrenceEntity, ScheduledOccurrenceHiveModel, void> {
  @override
  ScheduledOccurrenceHiveModel toLocalModel(ScheduledOccurrenceEntity entity) =>
      ScheduledOccurrenceHiveModel(
        id: entity.id,
        createdAt: entity.createdAt,
        ownerId: entity.userId,
        taskId: entity.taskId,
        startDateTime: entity.startDateTime,
        endDateTime: entity.endDateTime,
        schedulerId: entity.schedulerId,
        schedulerType: entity.schedulerType,
        occurrenceStatus: entity.occurrenceStatus,
        sequenceNumber: entity.sequenceNumber,
        successPercentage: entity.successPercentage,
        timezone: entity.timezone,
        timeMode: entity.timeMode,
        updatedAt: entity.updatedAt,
        description: entity.description,
        order: entity.order,
        sharedWithUserIds: const [],
      );

  @override
  void toRemoteModel(ScheduledOccurrenceEntity entity) {}

  @override
  ScheduledOccurrenceEntity toEntityFromLocal(ScheduledOccurrenceHiveModel model) =>
      ScheduledOccurrenceEntity(
        id: model.id,
        userId: model.ownerId,
        createdAt: model.createdAt,
        taskId: model.taskId,
        startDateTime: model.startDateTime,
        endDateTime: model.endDateTime,
        schedulerId: model.schedulerId,
        schedulerType: model.schedulerType,
        occurrenceStatus: model.occurrenceStatus,
        sequenceNumber: model.sequenceNumber,
        timeMode: model.timeMode,
        description: model.description,
        updatedAt: model.updatedAt,
        successPercentage: model.successPercentage,
        timezone: model.timezone,
        order: model.order,
      );

  @override
  ScheduledOccurrenceEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
