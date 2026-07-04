import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/schedule/date_range_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/date_range_hive_model.dart';
import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/date_range.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/date_range_repository.dart';
import 'package:zamaan/shared/data/repositories/base_owned_repository_impl.dart';
import 'package:zamaan/shared/domain/enums/entity_type.dart';

class DateRangeRepositoryImpl
    extends
        BaseOwnedRepositoryImpl<
          DateRangeEntity,
          DateRangeHiveModel,
          DateRangeLocalDataSource<DateRangeHiveModel>
        >
    implements DateRangeRepository {
  DateRangeRepositoryImpl({
    required super.localDataSource,
    required super.dataMapper,
    required super.currentUserProvider,
  }) : super(entityType: EntityType.schedule);

  @override
  EResultFuture<List<DateRangeEntity>> getByParentId(String parentId) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByParentId(parentId: parentId, userId: userId);
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<DateRangeEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get date ranges by parent ID $entityType',
      );
    }
  }
}
