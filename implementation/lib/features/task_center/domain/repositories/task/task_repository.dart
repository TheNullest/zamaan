import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/task/task.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

import 'package:zamaan/shared/domain/repositories/base_repository.dart';

/// Repository for [TaskEntity] operations.
abstract class TaskRepository extends BaseRepository<TaskEntity> {
  /// Retrieves all tasks with a specific [status].
  EResultFuture<List<TaskEntity>> getByStatus(TaskStatus status);

  /// Retrieves all completed tasks (shorthand for `getByStatus(TaskStatus.done)`).
  EResultFuture<List<TaskEntity>> getCompletedTasks();

  /// Retrieves tasks with a specific [priority].
  EResultFuture<List<TaskEntity>> getByPriority(Priority priority);

  /// Retrieves tasks belonging to a given [categoryId].
  EResultFuture<List<TaskEntity>> getByCategory(String categoryId);

  /// Retrieves tasks having a specific [tagId].
  EResultFuture<List<TaskEntity>> getByTag(String tagId);

  /// Retrieves tasks belonging to a given [projectId].
  EResultFuture<List<TaskEntity>> getByProject(String projectId);

  /// Retrieves all archived tasks.
  EResultFuture<List<TaskEntity>> getArchived();

  /// Performs a full‑text search on task [title] and [description].
  EResultFuture<List<TaskEntity>> search(String query);

  /// Retrieves tasks that are overdue (current date > dueDate and not completed).
  EResultFuture<List<TaskEntity>> getOverdue();
}
