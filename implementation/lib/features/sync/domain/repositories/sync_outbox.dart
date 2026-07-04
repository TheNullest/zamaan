import 'package:zamaan/core/utils/typedef.dart';

/// Remote mutation that must eventually be synchronized.
enum PendingSyncAction { create, update, delete }

/// Stores and flushes pending remote sync operations.
///
/// Local-first repositories write to local storage first. When the app is
/// offline, or when a remote write fails after the local write succeeds, the
/// repository records a pending operation in this outbox.
///
/// A concrete implementation may persist full payloads, entity IDs, operation
/// metadata, retries, timestamps, device IDs, or conflict information. This base
/// contract only captures the minimum needed by shared repositories.
abstract class SyncOutbox {
  /// Adds a pending sync operation for one entity.
  ///
  /// [entityType] lets a shared outbox route work to the correct concrete
  /// repository or remote endpoint later.
  EResultFutureVoid add({
    required String entityType,
    required String entityId,
    required String userId,
    required PendingSyncAction action,
  });

  /// Attempts to push pending operations for [userId] to the remote source.
  ///
  /// Implementations should keep failed operations queued so they can be
  /// retried later.
  EResultFutureVoid flush({required String userId});
}
