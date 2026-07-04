import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/task/sub_task_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/task/sub_task_hive_model.dart';
import 'package:zamaan/features/task_center/domain/entities/task/sub_task.dart';
import 'package:zamaan/features/task_center/domain/repositories/task/sub_task_repository.dart';
import 'package:zamaan/shared/data/repositories/base_owned_repository_impl.dart';
import 'package:zamaan/shared/domain/enums/entity_type.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

class SubTaskRepositoryImpl
    extends
        BaseOwnedRepositoryImpl<
          SubTaskEntity,
          SubTaskHiveModel,
          SubTaskLocalDataSource<SubTaskHiveModel>
        >
    implements SubTaskRepository {
  SubTaskRepositoryImpl({
    required super.localDataSource,
    required super.dataMapper,
    required super.currentUserProvider,
  }) : super(entityType: EntityType.subTask);

  @override
  EResultFuture<List<SubTaskEntity>> getByTaskId(String taskId) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByTaskId(taskId: taskId, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<SubTaskEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get subtasks by task ID $entityType',
      );
    }
  }

  @override
  EResultFuture<List<SubTaskEntity>> getByPriority(Priority priority) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByPriority(priority: priority, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<SubTaskEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get subtasks by priority $entityType',
      );
    }
  }

  @override
  EResultFuture<List<SubTaskEntity>> getByStatus(TaskStatus status) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByStatus(status: status, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<SubTaskEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get subtasks by status $entityType',
      );
    }
  }

  @override
  EResultFuture<List<SubTaskEntity>> getCompletedSubTasks() => getByStatus(TaskStatus.done);
}
