import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_day_time.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/scheduled_day_time_hive_model.dart';

class ScheduledDayTimeMapper
    extends BaseDataMapper<ScheduledDayTimeEntity, ScheduledDayTimeHiveModel, void> {
  @override
  ScheduledDayTimeHiveModel toLocalModel(ScheduledDayTimeEntity entity) =>
      ScheduledDayTimeHiveModel(
        id: entity.id,
        createdAt: entity.createdAt,
        ownerId: entity.userId,
        taskId: entity.taskId,
        dayType: entity.dayType,
        dayLabel: entity.dayLabel,
        timeMode: entity.timeMode,
        repeatCount: entity.repeatCount,
        startTime: entity.startTime,
        endTime: entity.endTime,
        updatedAt: entity.updatedAt,
        description: entity.description,
        order: entity.order,
        sharedWithUserIds: const [],
      );

  @override
  void toRemoteModel(ScheduledDayTimeEntity entity) {}

  @override
  ScheduledDayTimeEntity toEntityFromLocal(ScheduledDayTimeHiveModel model) =>
      ScheduledDayTimeEntity(
        id: model.id,
        userId: model.ownerId,
        createdAt: model.createdAt,
        taskId: model.taskId,
        dayType: model.dayType,
        dayLabel: model.dayLabel,
        timeMode: model.timeMode,
        repeatCount: model.repeatCount,
        startTime: model.startTime,
        endTime: model.endTime,
        description: model.description,
        updatedAt: model.updatedAt,
        order: model.order,
      );

  @override
  ScheduledDayTimeEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
