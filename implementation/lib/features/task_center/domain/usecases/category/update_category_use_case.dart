import 'package:zamaan/features/task_center/domain/entities/category.dart';
import 'package:zamaan/features/task_center/domain/repositories/category_repository.dart';
import 'package:zamaan/shared/domain/use_cases/update_use_case.dart';

/// Updates an existing category.
class UpdateCategoryUseCase extends UpdateUseCase<CategoryEntity, CategoryRepository> {
  UpdateCategoryUseCase(super.repository);
}
