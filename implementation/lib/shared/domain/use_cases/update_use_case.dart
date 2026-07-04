import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

abstract class UpdateUseCase<Entity, Repo extends BaseRepository<Entity>>
    extends UseCaseWithParams<Repo, void, Entity> {
  UpdateUseCase(super.repository);

  @override
  EResultFutureVoid call(Entity entity) async => repository.update(entity);
}
