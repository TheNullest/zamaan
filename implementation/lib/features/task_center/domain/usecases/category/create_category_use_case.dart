import 'package:zamaan/features/task_center/domain/entities/category.dart';
import 'package:zamaan/features/task_center/domain/repositories/category_repository.dart';
import 'package:zamaan/shared/domain/use_cases/create_use_case.dart';

/// Creates a new category and returns its generated ID.
class CreateCategoryUseCase extends CreateUseCase<CategoryRepository, CategoryEntity> {
  CreateCategoryUseCase(super.repository);
}
