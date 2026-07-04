import 'package:dartz/dartz.dart';
import 'package:zamaan/core/error/exceptions/local_exception.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/user_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

/// Creates or replaces the local current user without requiring remote registration.
class CreateLocalUserUseCase extends UseCaseWithParams<UserRepository, void, UserEntity> {
  CreateLocalUserUseCase(super.repository);

  @override
  EResultFuture<void> call(UserEntity params) async {
    try {
      return repository.createLocalUser(params);
    } catch (e) {
      return Left(
        LocalException(message: 'Failed to create local user: $e', stackTrace: StackTrace.current),
      );
    }
  }
}
