import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

abstract class CreateBatchUseCase<Repo extends BaseRepository<Entity>, Entity>
    extends UseCaseWithParams<Repo, void, List<Entity>> {
  CreateBatchUseCase(super.repository);
  @override
  EResultFutureVoid call(List<Entity> params) async => repository.createBatch(params);
}
