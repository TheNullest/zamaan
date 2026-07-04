import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/date_range.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/date_range_hive_model.dart';

class DateRangeMapper extends BaseDataMapper<DateRangeEntity, DateRangeHiveModel, void> {
  @override
  DateRangeHiveModel toLocalModel(DateRangeEntity entity) => DateRangeHiveModel(
    id: entity.id,
    createdAt: entity.createdAt,
    ownerId: entity.userId,
    parentId: entity.parentId,
    startDate: entity.startDate,
    endDate: entity.endDate,
    updatedAt: entity.updatedAt,
    description: entity.description,
    order: entity.order,
    sharedWithUserIds: const [],
  );

  @override
  void toRemoteModel(DateRangeEntity entity) {}

  @override
  DateRangeEntity toEntityFromLocal(DateRangeHiveModel model) => DateRangeEntity(
    id: model.id,
    userId: model.ownerId,
    createdAt: model.createdAt,
    parentId: model.parentId,
    startDate: model.startDate,
    endDate: model.endDate,
    description: model.description,
    updatedAt: model.updatedAt,
    order: model.order,
  );

  @override
  DateRangeEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
