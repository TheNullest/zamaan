import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/domain/entities/user_entity.dart';

/// Abstraction over user identity operations.
///
/// This repository is intended for local user management and can later be
/// extended to support remote auth or user synchronization.
abstract class UserRepository {
  /// Returns the current local user, or `null` if none exists.
  EResultFuture<UserEntity?> getCurrentUser();

  /// Creates or replaces the current local user.
  EResultFuture<void> createLocalUser(UserEntity user);

  /// Updates the current local user's profile.
  EResultFuture<void> updateUserProfile(UserEntity user);

  /// Marks the current local user as registered.
  EResultFuture<void> markUserAsRegistered(UserEntity user);
}
