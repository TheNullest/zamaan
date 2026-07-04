import 'package:zamaan/features/task_center/domain/entities/category.dart';
import 'package:zamaan/features/task_center/domain/repositories/category_repository.dart';
import 'package:zamaan/shared/domain/use_cases/get_all_use_case.dart';

/// Returns all categories.
class GetAllCategoriesUseCase extends GetAllUseCase<CategoryRepository, CategoryEntity> {
  GetAllCategoriesUseCase(super.repository);
}
