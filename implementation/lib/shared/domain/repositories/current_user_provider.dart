// lib/shared/domain/repositories/current_user_provider.dart
import 'package:zamaan/shared/domain/entities/user_entity.dart';

/// Provides the current local user's identity to domain/data services.
///
/// Repositories depend on this abstraction (read side) instead of reading
/// presentation state such as Cubits directly. Auth use cases use the write
/// side ([setCurrentUser]).
abstract class CurrentUserProvider {
  /// The local ID of the current user. Empty string when no user is set.
  String get userId;

  /// True only when [RegistrationStatus] is `registered`
  /// (NOT simply "has a remote account" — an anonymous account is remote but
  /// not fully registered).
  bool get isRegistered;

  /// The full [UserEntity] if a user is set, otherwise `null`.
  UserEntity? get currentUser;

  /// Loads the cached user from storage. Call once during app bootstrap,
  /// before any repository operation that reads [userId].
  Future<void> load();

  /// Creates, replaces, or clears the current user.
  ///
  /// - Non-null: persists the user (refreshing `updatedAt` to now).
  ///   `createdAt` is taken from the entity as-is and is never mutated here.
  /// - null: clears the current-user record (logout of identity only).
  ///   NOTE: this does NOT wipe owned data — wiping every box is the
  ///   responsibility of a `LogoutUseCase` / `HiveInitializer.resetAll()`.
  Future<void> setCurrentUser(UserEntity? user);
}
