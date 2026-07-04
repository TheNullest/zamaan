import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/features/task_center/domain/entities/goal.dart';
import 'package:zamaan/features/task_center/data/models/local/goal_hive_model.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

class GoalMapper extends BaseDataMapper<GoalEntity, GoalHiveModel, void> {
  @override
  GoalHiveModel toLocalModel(GoalEntity entity) => GoalHiveModel(
    id: entity.id,
    createdAt: entity.createdAt,
    ownerId: entity.userId,
    refType: entity.refType,
    refId: entity.refId,
    measurementUnit: entity.measurementUnit,
    goalConstraint: entity.goalConstraint,
    customMeasurementUnitId: entity.customMeasurementUnitId,
    goalTargets: entity.goalTargets.map((k, v) => MapEntry(k.index, v)),
    updatedAt: entity.updatedAt,
    description: entity.description,
    order: entity.order,
    sharedWithUserIds: const [],
  );

  @override
  void toRemoteModel(GoalEntity entity) {}

  @override
  GoalEntity toEntityFromLocal(GoalHiveModel model) => GoalEntity(
    id: model.id,
    userId: model.ownerId,
    createdAt: model.createdAt,
    refType: model.refType,
    refId: model.refId,
    measurementUnit: model.measurementUnit,
    goalConstraint: model.goalConstraint,
    customMeasurementUnitId: model.customMeasurementUnitId,
    goalTargets: model.goalTargets.map((k, v) => MapEntry(RepetitionType.values[k], v)),
    description: model.description,
    updatedAt: model.updatedAt,
    order: model.order,
  );

  @override
  GoalEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
