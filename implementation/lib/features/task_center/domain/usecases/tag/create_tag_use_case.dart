import 'package:zamaan/features/task_center/domain/entities/tag.dart';
import 'package:zamaan/features/task_center/domain/repositories/tag_repository.dart';
import 'package:zamaan/shared/domain/use_cases/create_use_case.dart';

/// Creates a new tag and returns its generated ID.
class CreateTagUseCase extends CreateUseCase<TagRepository, TagEntity> {
  CreateTagUseCase(super.repository);
}
