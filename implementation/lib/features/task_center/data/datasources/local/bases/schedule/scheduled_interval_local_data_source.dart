// lib/features/task_center/data/datasources/local/scheduled_interval_local_data_source.dart
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/datasources/local/base_local_data_source.dart';
import 'package:zamaan/shared/data/models/local/bases/base_owned_local_model.dart';

abstract class ScheduledIntervalLocalDataSource<Model extends BaseOwnedLocalModel>
    extends BaseLocalDataSource<Model> {
  /// Retrieves all interval‑based scheduling rules belonging to a specific [taskId].
  EResultFuture<List<Model>> getByTaskId({required String taskId, required String userId});
}
