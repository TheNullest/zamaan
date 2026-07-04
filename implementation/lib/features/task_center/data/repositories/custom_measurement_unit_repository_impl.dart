import 'package:zamaan/features/task_center/data/datasources/local/bases/custom_measurement_unit_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/custom_measurement_unit_hive_model.dart';
import 'package:zamaan/features/task_center/domain/entities/custom_measurement_unit.dart';
import 'package:zamaan/features/task_center/domain/repositories/custom_measurement_unit_repository.dart';
import 'package:zamaan/shared/data/repositories/base_owned_repository_impl.dart';
import 'package:zamaan/shared/domain/enums/entity_type.dart';

class CustomMeasurementUnitRepositoryImpl
    extends
        BaseOwnedRepositoryImpl<
          CustomMeasurementUnitEntity,
          CustomMeasurementUnitHiveModel,
          CustomMeasurementUnitLocalDataSource<CustomMeasurementUnitHiveModel>
        >
    implements CustomMeasurementUnitRepository {
  CustomMeasurementUnitRepositoryImpl({
    required super.localDataSource,
    required super.dataMapper,
    required super.currentUserProvider,
  }) : super(entityType: EntityType.settings);
}
