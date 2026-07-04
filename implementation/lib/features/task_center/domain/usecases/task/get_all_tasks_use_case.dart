import 'package:zamaan/features/task_center/domain/entities/task/task.dart';
import 'package:zamaan/features/task_center/domain/repositories/task/task_repository.dart';
import 'package:zamaan/shared/domain/use_cases/get_all_use_case.dart';

/// Returns all tasks from the task repository.
class GetAllTasksUseCase extends GetAllUseCase<TaskRepository, TaskEntity> {
  GetAllTasksUseCase(super.repository);
}
