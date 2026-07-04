import 'package:zamaan/features/task_center/domain/repositories/schedule/schedule_constraints_repository.dart';
import 'package:zamaan/shared/domain/use_cases/delete_use_case.dart';

/// Deletes a schedule constraints definition.
class DeleteScheduleConstraintsUseCase extends DeleteUseCase<ScheduleConstraintsRepository> {
  DeleteScheduleConstraintsUseCase(super.repository);
}
