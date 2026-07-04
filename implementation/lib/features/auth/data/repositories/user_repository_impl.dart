import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/auth/data/datasources/auth_user_local_data_source.dart';
import 'package:zamaan/shared/data/mappers/user_mapper.dart';
import 'package:zamaan/shared/domain/entities/user_entity.dart';
import 'package:zamaan/shared/domain/enums/hive/registration_status.dart';
import 'package:zamaan/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthUserLocalDataSource _dataSource;
  final UserMapper _mapper;

  UserRepositoryImpl({required AuthUserLocalDataSource dataSource, required UserMapper mapper})
    : _dataSource = dataSource,
      _mapper = mapper;

  @override
  EResultFuture<void> createLocalUser(UserEntity user) async {
    final stamped = user.copyWith(updatedAt: DateTime.now());
    final result = await _dataSource.saveCurrentUser(_mapper.toLocalModel(stamped));
    return result.map((_) => Future.value(null));
  }

  @override
  EResultFuture<UserEntity?> getCurrentUser() async {
    final result = await _dataSource.getCurrentUser();
    return result.map((model) => model == null ? null : _mapper.toEntityFromLocal(model));
  }

  @override
  EResultFuture<void> updateUserProfile(UserEntity user) async {
    final stamped = user.copyWith(updatedAt: DateTime.now());
    final result = await _dataSource.saveCurrentUser(_mapper.toLocalModel(stamped));
    return result.map((_) => Future.value(null));
  }

  @override
  EResultFuture<void> markUserAsRegistered(UserEntity user) async {
    final updatedUser = user.copyWith(registrationStatus: RegistrationStatus.registered);
    final stamped = updatedUser.copyWith(updatedAt: DateTime.now());
    final result = await _dataSource.saveCurrentUser(_mapper.toLocalModel(stamped));
    return result.map((_) => Future.value(null));
  }
}
