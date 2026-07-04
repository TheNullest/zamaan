// lib/shared/data/datasources/local/hive/user_hive_local_data_source_impl.dart
import 'package:dartz/dartz.dart';
import 'package:hive_ce/hive.dart';

import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/datasources/user/user_local_data_source.dart';
import 'package:zamaan/shared/data/models/local/user/user_hive_model.dart';

class UserHiveLocalDataSourceImpl implements UserLocalDataSource {
  static const String _userKey = 'current_user';

  final Box<UserHiveModel> box;

  UserHiveLocalDataSourceImpl({required this.box});

  @override
  EResultFuture<UserHiveModel?> getCurrentUser() async {
    try {
      return Right(box.get(_userKey));
    } catch (e, st) {
      return toFailureEither<UserHiveModel?>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFutureVoid saveCurrentUser(UserHiveModel model) async {
    try {
      await box.put(_userKey, model);
      return const Right(null);
    } catch (e, st) {
      return toFailureEither<void>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFutureVoid clearCurrentUser() async {
    try {
      await box.delete(_userKey);
      return const Right(null);
    } catch (e, st) {
      return toFailureEither<void>(e: e, stackTrace: st);
    }
  }
}
