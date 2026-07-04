import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/models/local/bases/base_owned_local_model.dart';

/// Base contract for local persistence used by local-first repositories.
///
/// Implement this in the data layer for storage engines such as Hive, Isar,
/// SQLite, or any other on-device database. Local data is treated as the
/// source of truth for ordinary CRUD operations, so every method returns an
/// [EResultFuture] to keep storage failures explicit.
///
/// All read, delete, and existence methods require a [userId] so local records
/// are always scoped to the current registered user. This prevents data from
/// leaking between accounts on the same device.
///
/// The [Model] type is the local persistence model, not the domain entity.
abstract class BaseLocalDataSource<Model extends BaseOwnedLocalModel> {
  /// Returns all non-filtered local models that belong to [userId].
  EResultFuture<List<Model>> get({required String userId});

  /// Returns the local model with [id] for [userId], or null when it is absent.
  EResultFuture<Model?> getById({required String id, required String userId});

  /// Returns local models matching [ids] for [userId].
  ///
  /// Implementations may return fewer models than requested when some IDs are
  /// not present locally.
  EResultFuture<List<Model>> getByIds({required List<String> ids, required String userId});

  /// Persists a new local [model].
  ///
  /// The model should already contain the owner/user identifier when the
  /// concrete persistence schema requires it.
  EResultFutureVoid create(Model model);

  /// Persists multiple new local [models] in one operation.
  EResultFutureVoid createBatch(List<Model> models);

  /// Updates an existing local [model].
  EResultFutureVoid update(Model model);

  /// Updates multiple existing local [models] in one operation.
  EResultFutureVoid updateBatch(List<Model> models);

  /// Deletes or soft-deletes the local model with [id] for [userId].
  ///
  /// Local-first apps commonly soft-delete records so remote deletion can be
  /// synchronized later. Concrete implementations decide whether this is a hard
  /// delete or a tombstone update.
  EResultFutureVoid delete({required String id, required String userId});

  /// Deletes or soft-deletes multiple local models by [ids] for [userId].
  EResultFutureVoid deleteBatch({required List<String> ids, required String userId});

  /// Inserts or updates [models] during remote refresh/merge.
  ///
  /// This is used when remote records are pulled down and need to be merged into
  /// the local source of truth.
  EResultFutureVoid upsertBatch(List<Model> models);

  /// Returns whether a local model with [id] exists for [userId].
  EResultFuture<bool> exists({required String id, required String userId});
}
