import 'package:zamaan/features/task_center/domain/entities/tag.dart';
import 'package:zamaan/features/task_center/domain/repositories/tag_repository.dart';
import 'package:zamaan/shared/domain/use_cases/update_use_case.dart';

/// Updates an existing tag.
class UpdateTagUseCase extends UpdateUseCase<TagEntity, TagRepository> {
  UpdateTagUseCase(super.repository);
}
