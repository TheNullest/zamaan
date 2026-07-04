// lib/features/task_center/data/datasources/local/task_local_data_source.dart
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/datasources/local/base_local_data_source.dart';
import 'package:zamaan/shared/data/models/local/bases/base_owned_local_model.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

abstract class TaskLocalDataSource<Model extends BaseOwnedLocalModel>
    extends BaseLocalDataSource<Model> {
  /// Retrieves tasks with a specific [status] for the given [userId].
  EResultFuture<List<Model>> getByStatus({required TaskStatus status, required String userId});

  /// Retrieves tasks with a specific [priority].
  EResultFuture<List<Model>> getByPriority({required Priority priority, required String userId});

  /// Retrieves tasks belonging to a given [categoryId].
  EResultFuture<List<Model>> getByCategory({required String categoryId, required String userId});

  /// Retrieves tasks having a specific [tagId].
  EResultFuture<List<Model>> getByTag({required String tagId, required String userId});

  /// Retrieves tasks belonging to a given [projectId].
  EResultFuture<List<Model>> getByProject({required String projectId, required String userId});

  /// Retrieves all archived tasks.
  EResultFuture<List<Model>> getArchived({required String userId});

  /// Full‑text search on [title] and [description].
  EResultFuture<List<Model>> search({required String query, required String userId});

  /// Retrieves tasks that are overdue (current date > dueDate and not completed).
  EResultFuture<List<Model>> getOverdue({required DateTime now, required String userId});
}
