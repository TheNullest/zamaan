import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/schedule_constraints.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/schedule_constraints_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

/// Retrieves schedule constraints for a specific task.
class GetScheduleConstraintsForTaskUseCase
    extends
        UseCaseWithParams<ScheduleConstraintsRepository, List<ScheduleConstraintsEntity>, String> {
  GetScheduleConstraintsForTaskUseCase(super.repository);

  @override
  EResultFuture<List<ScheduleConstraintsEntity>> call(String params) async =>
      repository.getByTaskId(params);
}
