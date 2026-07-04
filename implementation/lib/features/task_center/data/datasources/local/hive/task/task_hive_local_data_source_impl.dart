import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/task/task_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/task/task_hive_model.dart';
import 'package:zamaan/shared/data/datasources/local/base_hive_local_data_source_impl.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

/// Hive implementation of [TaskLocalDataSource].
///
/// Inherits all base CRUD methods from [BaseHiveLocalDataSourceImpl].
/// Only task‑specific query methods are implemented here.
class TaskHiveLocalDataSourceImpl extends BaseHiveLocalDataSourceImpl<TaskHiveModel>
    implements TaskLocalDataSource<TaskHiveModel> {
  TaskHiveLocalDataSourceImpl({required super.box});

  @override
  EResultFuture<List<TaskHiveModel>> getByStatus({
    required TaskStatus status,
    required String userId,
  }) async {
    try {
      final filtered = box.values
          .where((model) => model.ownerId == userId && model.taskStatus == status)
          .toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<TaskHiveModel>>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFuture<List<TaskHiveModel>> getByPriority({
    required Priority priority,
    required String userId,
  }) async {
    try {
      final filtered = box.values
          .where((model) => model.ownerId == userId && model.priority == priority)
          .toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<TaskHiveModel>>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFuture<List<TaskHiveModel>> getByCategory({
    required String categoryId,
    required String userId,
  }) async {
    try {
      final filtered = box.values
          .where((model) => model.ownerId == userId && model.categoryIds.contains(categoryId))
          .toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<TaskHiveModel>>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFuture<List<TaskHiveModel>> getByTag({
    required String tagId,
    required String userId,
  }) async {
    try {
      final filtered = box.values
          .where((model) => model.ownerId == userId && model.fixedTagIds.contains(tagId))
          .toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<TaskHiveModel>>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFuture<List<TaskHiveModel>> getByProject({
    required String projectId,
    required String userId,
  }) async {
    // Note: TaskHiveModel does not have a projectId field in the current schema.
    // If added, filter here. For now, return empty list.
    return Right([]);
  }

  @override
  EResultFuture<List<TaskHiveModel>> getArchived({required String userId}) async {
    try {
      final filtered = box.values
          .where((model) => model.ownerId == userId && model.archived)
          .toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<TaskHiveModel>>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFuture<List<TaskHiveModel>> search({required String query, required String userId}) async {
    try {
      final lowerQuery = query.toLowerCase();
      final filtered = box.values.where((model) {
        if (model.ownerId != userId) return false;
        return model.title.toLowerCase().contains(lowerQuery) ||
            (model.description?.toLowerCase().contains(lowerQuery) ?? false);
      }).toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<TaskHiveModel>>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFuture<List<TaskHiveModel>> getOverdue({
    required DateTime now,
    required String userId,
  }) async {
    // Note: TaskHiveModel does not have a dueDate field. Add logic when available.
    return Right([]);
  }
}
