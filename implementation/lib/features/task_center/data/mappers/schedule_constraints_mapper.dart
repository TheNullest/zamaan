import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/schedule_constraints.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/schedule_constraints_hive_model.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

class ScheduleConstraintsMapper
    extends BaseDataMapper<ScheduleConstraintsEntity, ScheduleConstraintsHiveModel, void> {
  @override
  ScheduleConstraintsHiveModel toLocalModel(ScheduleConstraintsEntity entity) =>
      ScheduleConstraintsHiveModel(
        id: entity.id,
        createdAt: entity.createdAt,
        ownerId: entity.userId,
        taskId: entity.taskId,
        startDate: entity.startDate,
        endDate: entity.endDate,
        exceptionDates: entity.exceptionDates,
        exceptionWeekDays: entity.exceptionWeekDays.map((e) => e.index).toList(),
        exceptionMonthDays: entity.exceptionMonthDays,
        enforceScheduleBounds: entity.enforceScheduleBounds,
        updatedAt: entity.updatedAt,
        description: entity.description,
        order: entity.order,
        sharedWithUserIds: const [],
      );

  @override
  void toRemoteModel(ScheduleConstraintsEntity entity) {}

  @override
  ScheduleConstraintsEntity toEntityFromLocal(ScheduleConstraintsHiveModel model) =>
      ScheduleConstraintsEntity(
        id: model.id,
        userId: model.ownerId,
        createdAt: model.createdAt,
        taskId: model.taskId,
        enforceScheduleBounds: model.enforceScheduleBounds,
        exceptionDates: model.exceptionDates,
        exceptionWeekDays: model.exceptionWeekDays.map((i) => WeekDay.values[i]).toList(),
        exceptionMonthDays: model.exceptionMonthDays,
        startDate: model.startDate,
        endDate: model.endDate,
        description: model.description,
        updatedAt: model.updatedAt,
        order: model.order,
      );

  @override
  ScheduleConstraintsEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
