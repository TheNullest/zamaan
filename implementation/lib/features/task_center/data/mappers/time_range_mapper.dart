import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/time_range.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/time_range_hive_model.dart';

class TimeRangeMapper extends BaseDataMapper<TimeRangeEntity, TimeRangeHiveModel, void> {
  @override
  TimeRangeHiveModel toLocalModel(TimeRangeEntity entity) => TimeRangeHiveModel(
    id: entity.id,
    createdAt: entity.createdAt,
    ownerId: entity.userId,
    parentId: entity.parentId,
    start: entity.start,
    end: entity.end,
    updatedAt: entity.updatedAt,
    description: entity.description,
    order: entity.order,
    sharedWithUserIds: const [],
  );

  @override
  void toRemoteModel(TimeRangeEntity entity) {}

  @override
  TimeRangeEntity toEntityFromLocal(TimeRangeHiveModel model) => TimeRangeEntity(
    id: model.id,
    userId: model.ownerId,
    createdAt: model.createdAt,
    parentId: model.parentId,
    start: model.start,
    end: model.end,
    description: model.description,
    updatedAt: model.updatedAt,
    order: model.order,
  );

  @override
  TimeRangeEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
