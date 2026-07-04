import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/domain/entities/user_entity.dart';
import 'package:zamaan/features/auth/domain/repositories/user_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

/// Returns the currently loaded user from the local identity provider.
class GetCurrentUserUseCase extends UseCaseWithoutParams<UserRepository, UserEntity?> {
  GetCurrentUserUseCase(super.repository);

  @override
  EResultFuture<UserEntity?> call() async => repository.getCurrentUser();
}
