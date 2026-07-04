import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/datasources/local/base_local_data_source.dart';
import 'package:zamaan/shared/data/models/local/bases/base_owned_local_model.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

abstract class SubTaskLocalDataSource<Model extends BaseOwnedLocalModel>
    extends BaseLocalDataSource<Model> {
  /// Retrieves all subtasks belonging to a parent [taskId].
  EResultFuture<List<Model>> getByTaskId({required String taskId, required String userId});

  /// Retrieves subtasks with a specific [status].
  EResultFuture<List<Model>> getByStatus({required TaskStatus status, required String userId});

  /// Retrieves subtasks with a specific [priority].
  EResultFuture<List<Model>> getByPriority({required Priority priority, required String userId});
}
