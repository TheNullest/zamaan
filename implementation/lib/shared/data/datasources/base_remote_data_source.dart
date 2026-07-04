import 'package:zamaan/core/utils/typedef.dart';

/// Base contract for remote persistence used by local-first repositories.
///
/// Implement this in the data layer for APIs such as Supabase. Remote data is
/// not the normal read path for the app; it is used for synchronization,
/// cross-device restore, and explicit refresh operations.
///
/// Remote methods still return [EResultFuture] so networking, authentication,
/// and server errors stay explicit. Repository implementations decide whether a
/// remote failure should be returned to the caller or queued for later sync.
///
/// The [Model] type is the remote/API model, not the domain entity.
abstract class BaseRemoteDataSource<Model> {
  /// Returns all remote models that belong to [userId].
  EResultFuture<List<Model>> get({required String userId});

  /// Returns the remote model with [id] for [userId], or null when absent.
  EResultFuture<Model?> getById({required String id, required String userId});

  /// Creates [model] remotely.
  EResultFutureVoid create(Model model);

  /// Creates multiple remote [models] in one operation.
  EResultFutureVoid createBatch(List<Model> models);

  /// Updates [model] remotely.
  EResultFutureVoid update(Model model);

  /// Updates multiple remote [models] in one operation.
  EResultFutureVoid updateBatch(List<Model> models);

  /// Deletes the remote model with [id] for [userId].
  EResultFutureVoid delete({required String id, required String userId});

  /// Deletes multiple remote models by [ids] for [userId].
  EResultFutureVoid deleteBatch({
    required List<String> ids,
    required String userId,
  });
}
