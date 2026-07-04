import 'package:zamaan/features/task_center/domain/repositories/tag_repository.dart';
import 'package:zamaan/shared/domain/use_cases/delete_use_case.dart';

/// Deletes a tag by ID.
class DeleteTagUseCase extends DeleteUseCase<TagRepository> {
  DeleteTagUseCase(super.repository);
}
