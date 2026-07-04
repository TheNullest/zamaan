import 'package:zamaan/features/task_center/domain/entities/task/sub_task.dart';
import 'package:zamaan/features/task_center/domain/repositories/task/sub_task_repository.dart';
import 'package:zamaan/shared/domain/use_cases/create_use_case.dart';

/// Creates a new subtask and returns its generated ID.
class CreateSubtaskUseCase extends CreateUseCase<SubTaskRepository, SubTaskEntity> {
  CreateSubtaskUseCase(super.repository);
}
