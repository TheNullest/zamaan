import 'package:zamaan/features/task_center/domain/entities/task/task.dart';
import 'package:zamaan/features/task_center/domain/repositories/task/task_repository.dart';
import 'package:zamaan/shared/domain/use_cases/create_use_case.dart';

/// Creates a new task and returns its generated ID.
class CreateTaskUseCase extends CreateUseCase<TaskRepository, TaskEntity> {
  CreateTaskUseCase(super.repository);
}
