import 'package:zamaan/features/task_center/domain/entities/schedule/schedule_constraints.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/schedule_constraints_repository.dart';
import 'package:zamaan/shared/domain/use_cases/update_use_case.dart';

/// Updates an existing schedule constraints definition.
class UpdateScheduleConstraintsUseCase
    extends UpdateUseCase<ScheduleConstraintsEntity, ScheduleConstraintsRepository> {
  UpdateScheduleConstraintsUseCase(super.repository);
}
