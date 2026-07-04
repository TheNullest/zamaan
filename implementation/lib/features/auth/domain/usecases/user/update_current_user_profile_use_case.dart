import 'package:dartz/dartz.dart';
import 'package:zamaan/core/error/exceptions/local_exception.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/user_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

/// Updates the current local user's profile information.
class UpdateCurrentUserProfileUseCase extends UseCaseWithParams<UserRepository, void, UserEntity> {
  UpdateCurrentUserProfileUseCase(super.repository);

  @override
  EResultFuture<void> call(UserEntity params) async {
    try {
      return repository.updateUserProfile(params);
    } catch (e) {
      return Left(
        LocalException(
          message: 'Failed to update current user profile: $e',
          stackTrace: StackTrace.current,
        ),
      );
    }
  }
}
