import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/task/sub_task_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/task/sub_task_hive_model.dart';
import 'package:zamaan/shared/data/datasources/local/base_hive_local_data_source_impl.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

/// Hive implementation of [SubTaskLocalDataSource].
class SubTaskHiveLocalDataSourceImpl extends BaseHiveLocalDataSourceImpl<SubTaskHiveModel>
    implements SubTaskLocalDataSource<SubTaskHiveModel> {
  SubTaskHiveLocalDataSourceImpl({required super.box});

  @override
  EResultFuture<List<SubTaskHiveModel>> getByTaskId({
    required String taskId,
    required String userId,
  }) async {
    try {
      final filtered = box.values
          .where((model) => model.ownerId == userId && model.taskId == taskId)
          .toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<SubTaskHiveModel>>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFuture<List<SubTaskHiveModel>> getByStatus({
    required TaskStatus status,
    required String userId,
  }) async {
    try {
      final filtered = box.values
          .where((model) => model.ownerId == userId && model.status == status)
          .toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<SubTaskHiveModel>>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFuture<List<SubTaskHiveModel>> getByPriority({
    required Priority priority,
    required String userId,
  }) async {
    try {
      final filtered = box.values
          .where((model) => model.ownerId == userId && model.priority == priority)
          .toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<SubTaskHiveModel>>(e: e, stackTrace: st);
    }
  }
}
