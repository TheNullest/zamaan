// lib/shared/data/repositories/current_user_provider_impl.dart
import 'package:zamaan/shared/data/datasources/user/user_local_data_source.dart';
import 'package:zamaan/shared/data/mappers/user_mapper.dart';
import 'package:zamaan/shared/domain/entities/user_entity.dart';
import 'package:zamaan/shared/domain/enums/hive/registration_status.dart';
import 'package:zamaan/shared/domain/repositories/current_user_provider.dart';

/// Default implementation of [CurrentUserProvider].
///
/// Holds an in-memory cache ([_cachedUser]) so the synchronous read getters
/// (`userId`, `isRegistered`, `currentUser`) stay fast and do not touch the
/// box on every call. All persistence is delegated to [UserLocalDataSource],
/// and all (de)serialization to [UserMapper]. This class has ZERO direct
/// dependency on Hive.
class CurrentUserProviderImpl implements CurrentUserProvider {
  final UserLocalDataSource _dataSource;
  final UserMapper _mapper;
  UserEntity? _cachedUser;

  CurrentUserProviderImpl({required UserLocalDataSource dataSource, required UserMapper mapper})
    : _dataSource = dataSource,
      _mapper = mapper;

  @override
  Future<void> load() async {
    final result = await _dataSource.getCurrentUser();
    result.fold(
      (_) => _cachedUser = null, // storage failure → treat as no user
      (model) => _cachedUser = model == null ? null : _mapper.toEntityFromLocal(model),
    );
  }

  @override
  String get userId => _cachedUser?.id ?? '';

  @override
  bool get isRegistered => _cachedUser?.registrationStatus == RegistrationStatus.registered;

  @override
  UserEntity? get currentUser => _cachedUser;

  @override
  Future<void> setCurrentUser(UserEntity? user) async {
    if (user == null) {
      final result = await _dataSource.clearCurrentUser();
      // Only clear the cache if disk actually cleared — avoid memory/disk
      // divergence (the old code cleared the cache even on failure).
      result.fold((_) {}, (_) => _cachedUser = null);
      return;
    }

    // Provider owns ONLY updatedAt. createdAt comes from the entity factory.
    final stamped = user.copyWith(updatedAt: DateTime.now());
    final result = await _dataSource.saveCurrentUser(_mapper.toLocalModel(stamped));
    result.fold((_) {}, (_) => _cachedUser = stamped);
  }
}
