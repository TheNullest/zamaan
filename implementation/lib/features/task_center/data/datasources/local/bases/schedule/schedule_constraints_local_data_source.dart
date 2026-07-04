import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/datasources/local/base_local_data_source.dart';
import 'package:zamaan/shared/data/models/local/bases/base_owned_local_model.dart';

abstract class ScheduleConstraintsLocalDataSource<Model extends BaseOwnedLocalModel>
    extends BaseLocalDataSource<Model> {
  EResultFuture<List<Model>> getByTaskId({required String taskId, required String userId});
}
