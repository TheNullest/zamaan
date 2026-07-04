import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/datasources/user/user_local_data_source.dart';
import 'package:zamaan/shared/data/models/local/user/user_hive_model.dart';
import 'package:zamaan/features/auth/data/datasources/auth_user_local_data_source.dart';

class AuthUserHiveLocalDataSourceImpl implements AuthUserLocalDataSource {
  final UserLocalDataSource _userLocalDataSource;

  AuthUserHiveLocalDataSourceImpl({required UserLocalDataSource userLocalDataSource})
    : _userLocalDataSource = userLocalDataSource;

  @override
  EResultFuture<UserHiveModel?> getCurrentUser() => _userLocalDataSource.getCurrentUser();

  @override
  EResultFutureVoid saveCurrentUser(UserHiveModel model) =>
      _userLocalDataSource.saveCurrentUser(model);

  @override
  EResultFutureVoid clearCurrentUser() => _userLocalDataSource.clearCurrentUser();
}
