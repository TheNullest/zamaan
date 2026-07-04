import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/task/task_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/task/task_hive_model.dart';
import 'package:zamaan/features/task_center/domain/entities/task/task.dart';
import 'package:zamaan/features/task_center/domain/repositories/task/task_repository.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';
import 'package:zamaan/shared/domain/enums/entity_type.dart';
import 'package:zamaan/shared/data/repositories/base_owned_repository_impl.dart';

class TaskRepositoryImpl
    extends BaseOwnedRepositoryImpl<TaskEntity, TaskHiveModel, TaskLocalDataSource<TaskHiveModel>>
    implements TaskRepository {
  TaskRepositoryImpl({
    required super.localDataSource,
    required super.dataMapper,
    required super.currentUserProvider,
  }) : super(entityType: EntityType.task);

  // ----------------------------------------------------------------------
  // Additional query methods
  // ----------------------------------------------------------------------

  @override
  EResultFuture<List<TaskEntity>> getByStatus(TaskStatus status) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        // Assumes your BaseLocalDataSource has a method `getByStatus`
        final result = await localDataSource.getByStatus(status: status, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<TaskEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get tasks by status $entityType',
      );
    }
  }

  @override
  EResultFuture<List<TaskEntity>> getCompletedTasks() => getByStatus(TaskStatus.done);

  @override
  EResultFuture<List<TaskEntity>> getByPriority(Priority priority) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByPriority(priority: priority, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<TaskEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get tasks by priority $entityType',
      );
    }
  }

  @override
  EResultFuture<List<TaskEntity>> getByCategory(String categoryId) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByCategory(categoryId: categoryId, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<TaskEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get tasks by category $entityType',
      );
    }
  }

  @override
  EResultFuture<List<TaskEntity>> getByTag(String tagId) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByTag(tagId: tagId, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<TaskEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get tasks by tag $entityType',
      );
    }
  }

  @override
  EResultFuture<List<TaskEntity>> getByProject(String projectId) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByProject(projectId: projectId, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<TaskEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get tasks by project $entityType',
      );
    }
  }

  @override
  EResultFuture<List<TaskEntity>> getArchived() async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getArchived(userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<TaskEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get archived tasks $entityType',
      );
    }
  }

  @override
  EResultFuture<List<TaskEntity>> search(String query) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.search(query: query, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<TaskEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to search tasks $entityType',
      );
    }
  }

  @override
  EResultFuture<List<TaskEntity>> getOverdue() async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getOverdue(now: DateTime.now(), userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<TaskEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get overdue tasks $entityType',
      );
    }
  }
}
