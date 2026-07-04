import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/schedule/time_range_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/time_range_hive_model.dart';
import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/time_range.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/time_range_repository.dart';
import 'package:zamaan/shared/data/repositories/base_owned_repository_impl.dart';
import 'package:zamaan/shared/domain/enums/entity_type.dart';

class TimeRangeRepositoryImpl
    extends
        BaseOwnedRepositoryImpl<
          TimeRangeEntity,
          TimeRangeHiveModel,
          TimeRangeLocalDataSource<TimeRangeHiveModel>
        >
    implements TimeRangeRepository {
  TimeRangeRepositoryImpl({
    required super.localDataSource,
    required super.dataMapper,
    required super.currentUserProvider,
  }) : super(entityType: EntityType.schedule);

  @override
  EResultFuture<List<TimeRangeEntity>> getByParentId(String parentId) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByParentId(parentId: parentId, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<TimeRangeEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get time ranges by parent ID $entityType',
      );
    }
  }
}
