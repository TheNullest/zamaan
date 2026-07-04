import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

abstract class GetByIdUseCase<Repo extends BaseRepository<Entity>, Entity>
    extends UseCaseWithParams<Repo, Entity?, String> {
  GetByIdUseCase(super.repository);
  @override
  EResultFuture<Entity?> call(String params) async => repository.getById(params);
}
