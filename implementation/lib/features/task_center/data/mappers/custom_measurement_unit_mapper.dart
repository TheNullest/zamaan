import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/features/task_center/domain/entities/custom_measurement_unit.dart';
import 'package:zamaan/features/task_center/data/models/local/custom_measurement_unit_hive_model.dart';

class CustomMeasurementUnitMapper
    extends BaseDataMapper<CustomMeasurementUnitEntity, CustomMeasurementUnitHiveModel, void> {
  @override
  CustomMeasurementUnitHiveModel toLocalModel(CustomMeasurementUnitEntity entity) =>
      CustomMeasurementUnitHiveModel(
        id: entity.id,
        createdAt: entity.createdAt,
        ownerId: entity.userId,
        title: entity.title,
        isDouble: entity.isDouble,
        iconCode: entity.iconCode,
        updatedAt: entity.updatedAt,
        description: entity.description,
        order: entity.order,
        sharedWithUserIds: const [],
      );

  @override
  void toRemoteModel(CustomMeasurementUnitEntity entity) {}

  @override
  CustomMeasurementUnitEntity toEntityFromLocal(CustomMeasurementUnitHiveModel model) =>
      CustomMeasurementUnitEntity(
        id: model.id,
        userId: model.ownerId,
        createdAt: model.createdAt,
        title: model.title,
        isDouble: model.isDouble,
        iconCode: model.iconCode,
        description: model.description,
        updatedAt: model.updatedAt,
        order: model.order,
      );

  @override
  CustomMeasurementUnitEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
