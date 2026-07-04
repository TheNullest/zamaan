import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';import 'package:zamaan/features/task_center/data/datasources/local/bases/schedule/scheduled_occurrence_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/scheduled_occurrence_hive_model.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_occurrence.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_occurrence_repository.dart';
import 'package:zamaan/shared/data/repositories/base_owned_repository_impl.dart';
import 'package:zamaan/shared/domain/enums/entity_type.dart';

class ScheduledOccurrenceRepositoryImpl
    extends
        BaseOwnedRepositoryImpl<
          ScheduledOccurrenceEntity,
          ScheduledOccurrenceHiveModel,
          ScheduledOccurrenceLocalDataSource<ScheduledOccurrenceHiveModel>
        >
    implements ScheduledOccurrenceRepository {
  ScheduledOccurrenceRepositoryImpl({
    required super.localDataSource,
    required super.dataMapper,
    required super.currentUserProvider,
  }) : super(entityType: EntityType.schedule);

  @override
  EResultFuture<List<ScheduledOccurrenceEntity>> getByTaskId(String taskId) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByTaskId(taskId: taskId, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<ScheduledOccurrenceEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get scheduled occurrences by task ID $entityType',
      );
    }
  }
}
