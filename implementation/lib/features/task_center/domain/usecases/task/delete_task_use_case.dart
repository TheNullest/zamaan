import 'package:zamaan/features/task_center/domain/repositories/task/task_repository.dart';
import 'package:zamaan/shared/domain/use_cases/delete_use_case.dart';

/// Deletes a task by ID.
class DeleteTaskUseCase extends DeleteUseCase<TaskRepository> {
  DeleteTaskUseCase(super.repository);
}
