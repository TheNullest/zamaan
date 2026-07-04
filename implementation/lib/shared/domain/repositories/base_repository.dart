import 'package:zamaan/core/utils/typedef.dart';

/// Base repository for entities that are **not** owned by a user.
///
/// Examples: `UserEntity`, `AppSettings`, `ThemePreference`.
/// These entities do not have a `userId` and are global to the app instance.
///
/// All methods return an `EResult` (`Either<Failure, T>`) to explicitly
/// represent success or failure.
abstract class BaseRepository<Entity> {
  /// Retrieves all entities of this type.
  ///
  /// Returns a list (possibly empty) wrapped in `Right`.
  /// On failure, returns `Left<Failure>`.
  EResultFuture<List<Entity>> get();

  /// Retrieves a single entity by its [id].
  ///
  /// Returns `null` if no entity with this [id] exists.
  EResultFuture<Entity?> getById(String id);

  /// Retrieves multiple entities by their IDs.
  ///
  /// Returns only the entities that exist; missing IDs are ignored.
  EResultFuture<List<Entity>> getByIds(List<String> ids);

  /// Creates a new entity.
  ///
  /// The [entity] should already have a generated `id` (usually from `BaseEntity.create`).
  /// Returns the `id` of the created entity on success.
  EResultFuture<String> create(Entity entity);

  /// Updates an existing entity.
  ///
  /// Assumes the entity already exists. Behaviour for non‑existent entities is
  /// implementation‑specific (may fail with `NotFoundFailure`).
  EResultFutureVoid update(Entity entity);

  /// Deletes the entity with the given [id].
  EResultFutureVoid delete(String id);

  /// Deletes multiple entities by their IDs in a single batch operation.
  EResultFutureVoid deleteBatch(List<String> ids);

  /// Creates multiple entities in a single batch operation.
  ///
  /// All entities must be valid; partial failures are not allowed
  /// (atomic batch – either all succeed or none).
  EResultFutureVoid createBatch(List<Entity> entities);

  /// Updates multiple entities in a single batch operation.
  EResultFutureVoid updateBatch(List<Entity> entities);

  /// Checks whether an entity with the given [id] exists.
  EResultFuture<bool> exists(String id);
}
