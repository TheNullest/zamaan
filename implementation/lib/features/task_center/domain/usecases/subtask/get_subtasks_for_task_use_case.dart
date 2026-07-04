import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/task/sub_task.dart';
import 'package:zamaan/features/task_center/domain/repositories/task/sub_task_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

/// Returns all subtasks belonging to a given task.
class GetSubtasksForTaskUseCase
    extends UseCaseWithParams<SubTaskRepository, List<SubTaskEntity>, String> {
  GetSubtasksForTaskUseCase(super.repository);

  @override
  EResultFuture<List<SubTaskEntity>> call(String params) async => repository.getByTaskId(params);
}
