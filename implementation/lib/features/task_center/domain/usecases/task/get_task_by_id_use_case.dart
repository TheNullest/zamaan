import 'package:zamaan/features/task_center/domain/entities/task/task.dart';
import 'package:zamaan/features/task_center/domain/repositories/task/task_repository.dart';
import 'package:zamaan/shared/domain/use_cases/get_by_id_use_case.dart';

/// Returns a single task by its ID.
class GetTaskByIdUseCase extends GetByIdUseCase<TaskRepository, TaskEntity> {
  GetTaskByIdUseCase(super.repository);
}
