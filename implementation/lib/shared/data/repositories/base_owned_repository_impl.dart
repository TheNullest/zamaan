// lib/shared/data/repositories/base_owned_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:zamaan/core/error/exceptions/custom_auth_exception.dart';
import 'package:zamaan/core/error/exceptions/failure.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/datasources/local/base_local_data_source.dart';
import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/shared/data/models/local/bases/base_owned_local_model.dart';
import 'package:zamaan/shared/domain/entities/base_owned_entity.dart';
import 'package:zamaan/shared/domain/enums/entity_type.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';
import 'package:zamaan/shared/domain/repositories/current_user_provider.dart';

// Local‑only implementation of [BaseRepository] for offline‑first apps where
// every record is owned by the current authenticated user.
///
/// **Offline‑first behaviour:**
/// - All operations read/write exclusively to the local database.
/// - No remote sync is attempted – this is the responsibility of a separate
///   [SyncCoordinator] to be added when remote backend is available.
///
/// **User ownership enforcement:**
/// - Every operation first obtains the current user ID from [CurrentUserProvider].
/// - All local data source calls are filtered by that `userId`.
/// - Creating/updating an entity with a mismatched `userId` fails immediately.
///
/// **Error handling:**
/// - All exceptions are converted to [Failure] using [toFailureEither].
/// - Auth failures (no current user) return a [CustomAuthException].
///
/// **Type parameters:**
/// - `Entity`: The domain entity type (must extend [BaseOwnedEntity]).
/// - `LocalModel`: The local storage model type.
///   Must extend [BaseOwnedLocalModel] and is typically a Hive-owned model.
/// - `LocalDataSource`: The local data source used to persist `LocalModel`.
///
/// **Example concrete repository:**
/// ```dart
/// class TaskRepositoryImpl extends BaseOwnedRepositoryImpl<
///     TaskEntity,
///     TaskLocalModel,
///     TaskLocalDataSource>
///     implements TaskRepository {
///   TaskRepositoryImpl({
///     required super.localDataSource,
///     required super.dataMapper,
///     required super.currentUserProvider,
///   }) : super(entityType: EntityType.task);
/// }
/// ```
abstract class BaseOwnedRepositoryImpl<
  Entity extends BaseOwnedEntity,
  LocalModel extends BaseOwnedLocalModel,
  LocalDataSource extends BaseLocalDataSource<LocalModel>
>
    implements BaseRepository<Entity> {
  /// Creates a local‑only owned repository.
  ///
  /// - [localDataSource]: the Hive data source for `LocalModel`.
  /// - [dataMapper]: converts between [Entity] and [LocalModel] (remote model is
  ///   unused – pass `void` or ignore the third type parameter).
  /// - [currentUserProvider]: provides the current user's ID.
  /// - [entityType]: a stable name like `'task'` or `'goal'` used in error messages.
  BaseOwnedRepositoryImpl({
    required LocalDataSource localDataSource,
    required BaseDataMapper<Entity, LocalModel, void> dataMapper,
    required CurrentUserProvider currentUserProvider,
    required EntityType entityType,
  }) : _localDataSource = localDataSource,
       _dataMapper = dataMapper,
       _currentUserProvider = currentUserProvider,
       _entityType = entityType;

  final LocalDataSource _localDataSource;
  final BaseDataMapper<Entity, LocalModel, void> _dataMapper;
  final CurrentUserProvider _currentUserProvider;
  final EntityType _entityType;

  /// Returns the [EntityType] for this repository, used in error messages.
  @protected
  EntityType get entityType => _entityType;

  /// Returns the local data source for accessing `LocalModel` data from Hive.
  @protected
  LocalDataSource get localDataSource => _localDataSource;

  /// Returns the data mapper for converting between [Entity] and [LocalModel].
  @protected
  BaseDataMapper<Entity, LocalModel, void> get dataMapper => _dataMapper;

  /// Returns the current user ID or a [CustomAuthException] if none.
  ///
  /// Internal helper used by all public methods.
  @protected
  EResult<String> currentUserId() {
    final userId = _currentUserProvider.userId;
    if (userId.isEmpty) {
      return Left(
        CustomAuthException(
          message: 'No current user available for $_entityType operations.',
          stackTrace: StackTrace.current,
        ),
      );
    }
    return Right(userId);
  }

  /// Asserts that [entity] belongs to [userId].
  ///
  /// Returns a [CustomAuthException] if the `entity.userId` does not match.
  EResult<void> _ensureOwnership(Entity entity, String userId) {
    if (entity.userId != userId) {
      return Left(
        CustomAuthException(
          message: 'Entity $_entityType does not belong to current user.',
          stackTrace: StackTrace.current,
        ),
      );
    }
    return const Right(null);
  }

  @override
  EResultFuture<String> create(Entity entity) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final ownershipCheck = _ensureOwnership(entity, userId);
        if (ownershipCheck.isLeft()) {
          return ownershipCheck.fold(Left.new, (_) => Right(entity.id));
        }

        final localResult = await _localDataSource.create(_dataMapper.toLocalModel(entity));
        return localResult.fold((failure) => Left(failure), (_) => Right(entity.id));
      });
    } catch (e, st) {
      return toFailureEither<String>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to create $_entityType',
      );
    }
  }

  @override
  EResultFutureVoid update(Entity entity) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final ownershipCheck = _ensureOwnership(entity, userId);
        if (ownershipCheck.isLeft()) {
          return ownershipCheck.fold(Left.new, (_) => const Right(null));
        }

        final localResult = await _localDataSource.update(_dataMapper.toLocalModel(entity));
        return localResult.fold((failure) => Left(failure), (_) => const Right(null));
      });
    } catch (e, st) {
      return toFailureEither<void>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to update $_entityType',
      );
    }
  }

  @override
  EResultFutureVoid delete(String id) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        return await _localDataSource.delete(id: id, userId: userId);
      });
    } catch (e, st) {
      return toFailureEither<void>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to delete $_entityType',
      );
    }
  }

  @override
  EResultFuture<List<Entity>> get() async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final localResult = await _localDataSource.get(userId: userId);
        return localResult.fold(
          (failure) => Left(failure),
          (models) => Right(_dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<Entity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get $_entityType list',
      );
    }
  }

  @override
  EResultFuture<Entity?> getById(String id) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final localResult = await _localDataSource.getById(id: id, userId: userId);
        return localResult.fold(
          (failure) => Left(failure),
          (model) => Right(model == null ? null : _dataMapper.toEntityFromLocal(model)),
        );
      });
    } catch (e, st) {
      return toFailureEither<Entity?>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get $_entityType by ID',
      );
    }
  }

  @override
  EResultFuture<List<Entity>> getByIds(List<String> ids) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        final localResult = await _localDataSource.getByIds(ids: ids, userId: userId);
        return localResult.fold(
          (failure) => Left(failure),
          (models) => Right(_dataMapper.toEntitiesFromLocal(models)),
        );
      });
    } catch (e, st) {
      return toFailureEither<List<Entity>>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to get $_entityType by IDs',
      );
    }
  }

  @override
  EResultFutureVoid deleteBatch(List<String> ids) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        return await _localDataSource.deleteBatch(ids: ids, userId: userId);
      });
    } catch (e, st) {
      return toFailureEither<void>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to delete $_entityType batch',
      );
    }
  }

  @override
  EResultFutureVoid createBatch(List<Entity> entities) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        // Verify all entities belong to the current user
        for (final entity in entities) {
          final check = _ensureOwnership(entity, userId);
          if (check.isLeft()) return check.fold(Left.new, (_) => const Right(null));
        }

        final localModels = _dataMapper.toLocalModels(entities);
        final localResult = await _localDataSource.createBatch(localModels);
        return localResult.fold((failure) => Left(failure), (_) => const Right(null));
      });
    } catch (e, st) {
      return toFailureEither<void>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to create $_entityType batch',
      );
    }
  }

  @override
  EResultFutureVoid updateBatch(List<Entity> entities) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        for (final entity in entities) {
          final check = _ensureOwnership(entity, userId);
          if (check.isLeft()) return check.fold(Left.new, (_) => const Right(null));
        }

        final localModels = _dataMapper.toLocalModels(entities);
        final localResult = await _localDataSource.updateBatch(localModels);
        return localResult.fold((failure) => Left(failure), (_) => const Right(null));
      });
    } catch (e, st) {
      return toFailureEither<void>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to update $_entityType batch',
      );
    }
  }

  @override
  EResultFuture<bool> exists(String id) async {
    try {
      return await currentUserId().fold((failure) async => Left(failure), (userId) async {
        return await _localDataSource.exists(id: id, userId: userId);
      });
    } catch (e, st) {
      return toFailureEither<bool>(
        e: e,
        stackTrace: st,
        customMessage: 'Failed to check $_entityType existence',
      );
    }
  }
}
