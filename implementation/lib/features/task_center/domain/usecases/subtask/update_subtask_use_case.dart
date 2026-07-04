import 'package:zamaan/features/task_center/domain/entities/task/sub_task.dart';
import 'package:zamaan/features/task_center/domain/repositories/task/sub_task_repository.dart';
import 'package:zamaan/shared/domain/use_cases/update_use_case.dart';

/// Updates an existing subtask.
class UpdateSubtaskUseCase extends UpdateUseCase<SubTaskEntity, SubTaskRepository> {
  UpdateSubtaskUseCase(super.repository);
}
