import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/goal_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/goal_hive_model.dart';
import 'package:zamaan/features/task_center/domain/entities/goal.dart';
import 'package:zamaan/features/task_center/domain/repositories/goal_repository.dart';
import 'package:zamaan/shared/data/repositories/base_owned_repository_impl.dart';
import 'package:zamaan/shared/domain/enums/entity_type.dart';
import 'package:zamaan/shared/domain/enums/hive/reference_type.dart';

class GoalRepositoryImpl
    extends BaseOwnedRepositoryImpl<GoalEntity, GoalHiveModel, GoalLocalDataSource<GoalHiveModel>>
    implements GoalRepository {
  GoalRepositoryImpl({
    required super.localDataSource,
    required super.dataMapper,
    required super.currentUserProvider,
  }) : super(entityType: EntityType.goal);

  @override
  EResultFuture<List<GoalEntity>> getByReference({
    required String refId,
    required ReferenceType refType,
  }) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final result = await localDataSource.getByReference(
          refId: refId,
          refType: refType,
          userId: userId,
        );
        return result.fold(
          (failure) => Left(failure),
          (models) => Right(dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<GoalEntity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get goals by reference $entityType',
      );
    }
  }
}
