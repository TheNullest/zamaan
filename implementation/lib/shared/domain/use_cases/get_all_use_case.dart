import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

abstract class GetAllUseCase<Repo extends BaseRepository<Entity>, Entity>
    extends UseCaseWithoutParams<Repo, List<Entity>> {
  GetAllUseCase(super.repository);

  @override
  EResultFuture<List<Entity>> call() async => repository.get();
}
