import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/schedule/scheduled_day_time_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/scheduled_day_time_hive_model.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_day_time.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_day_time_repository.dart';
import 'package:zamaan/shared/data/repositories/base_owned_repository_impl.dart';
import 'package:zamaan/shared/domain/enums/entity_type.dart';

class ScheduledDayTimeRepositoryImpl
    extends
        BaseOwnedRepositoryImpl<
          ScheduledDayTimeEntity,
          ScheduledDayTimeHiveModel,
          ScheduledDayTimeLocalDataSource<ScheduledDayTimeHiveModel>
        >
    implements ScheduledDayTimeRepository {
  ScheduledDayTimeRepositoryImpl({
    required super.localDataSource,
    required super.dataMapper,
    required super.currentUserProvider,
  }) : super(entityType: EntityType.schedule);

  @override
  EResultFuture<List<ScheduledDayTimeEntity>> getByTaskId(String taskId) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByTaskId(taskId: taskId, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<ScheduledDayTimeEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get scheduled day times by task ID $entityType',
      );
    }
  }
}
