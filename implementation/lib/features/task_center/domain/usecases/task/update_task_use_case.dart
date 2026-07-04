import 'package:zamaan/features/task_center/domain/entities/task/task.dart';
import 'package:zamaan/features/task_center/domain/repositories/task/task_repository.dart';
import 'package:zamaan/shared/domain/use_cases/update_use_case.dart';

/// Updates an existing task.
class UpdateTaskUseCase extends UpdateUseCase<TaskEntity, TaskRepository> {
  UpdateTaskUseCase(super.repository);
}
