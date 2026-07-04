import 'package:dartz/dartz.dart';
import 'package:zamaan/core/error/exceptions/local_exception.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/user_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

/// Marks the current local user as registered, without requiring remote auth yet.
class MarkUserAsRegisteredUseCase extends UseCaseWithParams<UserRepository, void, UserEntity> {
  MarkUserAsRegisteredUseCase(super.repository);

  @override
  EResultFuture<void> call(UserEntity params) async {
    try {
      return repository.markUserAsRegistered(params);
    } catch (e) {
      return Left(
        LocalException(
          message: 'Failed to mark user as registered: $e',
          stackTrace: StackTrace.current,
        ),
      );
    }
  }
}
