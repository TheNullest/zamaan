import 'package:zamaan/features/task_center/domain/repositories/task/sub_task_repository.dart';
import 'package:zamaan/shared/domain/use_cases/delete_use_case.dart';

/// Deletes a subtask by ID.
class DeleteSubtaskUseCase extends DeleteUseCase<SubTaskRepository> {
  DeleteSubtaskUseCase(super.repository);
}
