// lib/shared/data/datasources/local/user_local_data_source.dart
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/models/local/user/user_hive_model.dart';

/// Local persistence for the current user record.
///
/// Deliberately separate from [BaseLocalDataSource] (which is userId-scoped):
/// the user is not "owned", and there is exactly one current-user record
/// stored under a fixed key.
abstract class UserLocalDataSource {
  /// Returns the stored current user, or `null` when none exists.
  EResultFuture<UserHiveModel?> getCurrentUser();

  /// Persists (creates or replaces) the current user under the fixed key.
  EResultFutureVoid saveCurrentUser(UserHiveModel model);

  /// Deletes the current-user record (logout).
  EResultFutureVoid clearCurrentUser();
}
