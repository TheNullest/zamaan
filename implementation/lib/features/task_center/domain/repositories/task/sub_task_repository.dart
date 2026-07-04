import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/task/sub_task.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

import 'package:zamaan/shared/domain/repositories/base_repository.dart';

/// Repository for [SubTaskEntity] operations.
abstract class SubTaskRepository extends BaseRepository<SubTaskEntity> {
  /// Retrieves all subtasks belonging to a parent [taskId].
  EResultFuture<List<SubTaskEntity>> getByTaskId(String taskId);

  /// Retrieves subtasks with a specific [status].
  EResultFuture<List<SubTaskEntity>> getByStatus(TaskStatus status);

  /// Retrieves all completed subtasks (shorthand).
  EResultFuture<List<SubTaskEntity>> getCompletedSubTasks();

  /// Retrieves subtasks with a specific [priority].
  EResultFuture<List<SubTaskEntity>> getByPriority(Priority priority);
}
