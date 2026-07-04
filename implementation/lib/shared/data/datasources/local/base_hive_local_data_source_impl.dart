// lib/shared/data/datasources/base_hive_local_data_source_impl.dart
import 'package:dartz/dartz.dart';
import 'package:hive_ce/hive.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/datasources/local/base_local_data_source.dart';
import 'package:zamaan/shared/data/models/local/bases/hive/base_hive_owned_model.dart';

/// Base Hive implementation of [BaseLocalDataSource].
///
/// Provides a reusable local persistence layer for Hive-backed models that
/// extend [BaseHiveOwnedModel]. It is intended for local-first data sources
/// where Hive is the source of truth for on-device state and every operation
/// is modeled as an explicit result.
///
/// This implementation enforces per-user isolation by validating the
/// model's [BaseHiveOwnedModel.ownerId] whenever it reads or removes records.
/// The `get`, `getById`, `getByIds`, `delete`, `deleteBatch`, and `exists`
/// methods all verify that returned or deleted models belong to the provided
/// [userId].
///
/// The Hive [Box] is keyed by model ID, and insert/update operations are
/// performed with `put`/`putAll`. The `create`, `update`, and `upsertBatch`
/// implementations all delegate to Hive's put semantics, so they behave as upserts
/// at the storage layer. This is a deliberate simplification for local cache
/// persistence.
///
/// Exceptions thrown by Hive are caught and converted through [toFailureEither]
/// into the error side of an [EResultFuture], allowing caller code to handle
/// storage failures without relying on exceptions.
abstract class BaseHiveLocalDataSourceImpl<Model extends BaseHiveOwnedModel>
    implements BaseLocalDataSource<Model> {
  final Box<Model> box;

  /// Creates a Hive-backed local data source using the provided [box].
  ///
  /// The [box] must store models of type [Model] and is used for all persistence
  /// operations in this data source.
  BaseHiveLocalDataSourceImpl({required this.box});

  @override
  EResultFuture<List<Model>> get({required String userId}) async {
    try {
      final all = box.values.where((m) => m.ownerId == userId).toList();
      return Right(all);
    } catch (e, st) {
      return toFailureEither<List<Model>>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFuture<Model?> getById({required String id, required String userId}) async {
    try {
      final model = box.get(id);
      if (model != null && model.ownerId == userId) return Right(model);
      return const Right(null);
    } catch (e, st) {
      return toFailureEither<Model?>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFuture<List<Model>> getByIds({required List<String> ids, required String userId}) async {
    try {
      final models = ids
          .map((id) => box.get(id))
          .whereType<Model>()
          .where((m) => m.ownerId == userId)
          .toList();
      return Right(models);
    } catch (e, st) {
      return toFailureEither<List<Model>>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFutureVoid create(Model model) async {
    try {
      await box.put(model.id, model);
      return const Right(null);
    } catch (e, st) {
      return toFailureEither<void>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFutureVoid createBatch(List<Model> models) async {
    try {
      final map = {for (final m in models) m.id: m};
      await box.putAll(map);
      return const Right(null);
    } catch (e, st) {
      return toFailureEither<void>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFutureVoid update(Model model) => create(model);

  @override
  EResultFutureVoid updateBatch(List<Model> models) => createBatch(models);

  @override
  EResultFutureVoid delete({required String id, required String userId}) async {
    try {
      final model = box.get(id);
      if (model != null && model.ownerId == userId) {
        await box.delete(id);
      }
      return const Right(null);
    } catch (e, st) {
      return toFailureEither<void>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFutureVoid deleteBatch({required List<String> ids, required String userId}) async {
    try {
      for (final id in ids) {
        final model = box.get(id);
        if (model != null && model.ownerId == userId) {
          await box.delete(id);
        }
      }
      return const Right(null);
    } catch (e, st) {
      return toFailureEither<void>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFutureVoid upsertBatch(List<Model> models) => createBatch(models);

  @override
  EResultFuture<bool> exists({required String id, required String userId}) async {
    try {
      final model = box.get(id);
      return Right(model != null && model.ownerId == userId);
    } catch (e, st) {
      return toFailureEither<bool>(e: e, stackTrace: st);
    }
  }
}
