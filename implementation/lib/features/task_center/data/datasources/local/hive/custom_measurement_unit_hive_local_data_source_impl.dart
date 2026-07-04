// lib/features/task_center/data/datasources/local/custom_measurement_unit_local_data_source_impl.dart
import 'package:zamaan/features/task_center/data/datasources/local/bases/custom_measurement_unit_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/custom_measurement_unit_hive_model.dart';
import 'package:zamaan/shared/data/datasources/local/base_hive_local_data_source_impl.dart';

class CustomMeasurementUnitHiveLocalDataSourceImpl
    extends BaseHiveLocalDataSourceImpl<CustomMeasurementUnitHiveModel>
    implements CustomMeasurementUnitLocalDataSource<CustomMeasurementUnitHiveModel> {
  CustomMeasurementUnitHiveLocalDataSourceImpl({required super.box});
}
