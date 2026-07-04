// lib/features/task_center/data/datasources/local/scheduled_day_time_local_data_source.dart
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/datasources/local/base_local_data_source.dart';
import 'package:zamaan/shared/data/models/local/bases/base_owned_local_model.dart';

abstract class ScheduledDayTimeLocalDataSource<Model extends BaseOwnedLocalModel>
    extends BaseLocalDataSource<Model> {
  /// Retrieves all scheduled day‑time rules belonging to a specific [taskId].
  EResultFuture<List<Model>> getByTaskId({required String taskId, required String userId});
}
