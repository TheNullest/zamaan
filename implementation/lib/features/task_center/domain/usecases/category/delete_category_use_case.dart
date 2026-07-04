import 'package:zamaan/features/task_center/domain/repositories/category_repository.dart';
import 'package:zamaan/shared/domain/use_cases/delete_use_case.dart';

/// Deletes a category by ID.
class DeleteCategoryUseCase extends DeleteUseCase<CategoryRepository> {
  DeleteCategoryUseCase(super.repository);
}
