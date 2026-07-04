import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/schedule/schedule_constraints_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/schedule_constraints_hive_model.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/schedule_constraints.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/schedule_constraints_repository.dart';
import 'package:zamaan/shared/data/repositories/base_owned_repository_impl.dart';
import 'package:zamaan/shared/domain/enums/entity_type.dart';

class ScheduleConstraintsRepositoryImpl
    extends
        BaseOwnedRepositoryImpl<
          ScheduleConstraintsEntity,
          ScheduleConstraintsHiveModel,
          ScheduleConstraintsLocalDataSource<ScheduleConstraintsHiveModel>
        >
    implements ScheduleConstraintsRepository {
  ScheduleConstraintsRepositoryImpl({
    required super.localDataSource,
    required super.dataMapper,
    required super.currentUserProvider,
  }) : super(entityType: EntityType.schedule);

  @override
  EResultFuture<List<ScheduleConstraintsEntity>> getByTaskId(String taskId) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByTaskId(taskId: taskId, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<ScheduleConstraintsEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get schedule constraints by task ID $entityType',
      );
    }
  }
}
