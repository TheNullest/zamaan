/// Maps between domain entities, local persistence models, and remote API models.
///
/// Repositories use this mapper to keep domain code independent from Hive,
/// Supabase, JSON, and other data-layer details.
///
/// Type parameters:
/// - [Entity]: domain entity used by use cases and repository interfaces.
/// - [LocalModel]: model stored in the local database.
/// - [RemoteModel]: model sent to or received from the remote API.
abstract class BaseDataMapper<Entity, LocalModel, RemoteModel> {
  /// Converts a domain [entity] into a local persistence model.
  LocalModel toLocalModel(Entity entity);

  /// Converts domain [entities] into local persistence models.
  List<LocalModel> toLocalModels(List<Entity> entities) =>
      entities.map(toLocalModel).toList();

  /// Converts a domain [entity] into a remote/API model.
  RemoteModel toRemoteModel(Entity entity);

  /// Converts domain [entities] into remote/API models.
  List<RemoteModel> toRemoteModels(List<Entity> entities) =>
      entities.map(toRemoteModel).toList();

  /// Converts a local persistence [model] into a domain entity.
  Entity toEntityFromLocal(LocalModel model);

  /// Converts local persistence [models] into domain entities.
  List<Entity> toEntitiesFromLocal(List<LocalModel> models) =>
      models.map(toEntityFromLocal).toList();

  /// Converts a remote/API [model] into a domain entity.
  Entity toEntityFromRemote(RemoteModel model);

  /// Converts remote/API [models] into domain entities.
  List<Entity> toEntitiesFromRemote(List<RemoteModel> models) =>
      models.map(toEntityFromRemote).toList();
}
