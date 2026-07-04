import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

abstract class CreateUseCase<Repo extends BaseRepository<Entity>, Entity>
    extends UseCaseWithParams<Repo, String, Entity> {
  CreateUseCase(super.repository);
  @override
  EResultFuture<String> call(Entity params) async => repository.create(params);
}
