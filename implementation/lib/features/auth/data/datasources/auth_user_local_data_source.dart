import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/models/local/user/user_hive_model.dart';

/// Feature-level datasource contract for auth-local user persistence.
///
/// This keeps auth logic owned by the auth feature while reusing the shared
/// low-level user storage implementation.
abstract class AuthUserLocalDataSource {
  EResultFuture<UserHiveModel?> getCurrentUser();
  EResultFutureVoid saveCurrentUser(UserHiveModel model);
  EResultFutureVoid clearCurrentUser();
}
