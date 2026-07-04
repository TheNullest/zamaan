import 'package:zamaan/features/task_center/domain/entities/schedule/schedule_constraints.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/schedule_constraints_repository.dart';
import 'package:zamaan/shared/domain/use_cases/create_use_case.dart';

/// Creates a new schedule constraints definition.
class CreateScheduleConstraintsUseCase
    extends CreateUseCase<ScheduleConstraintsRepository, ScheduleConstraintsEntity> {
  CreateScheduleConstraintsUseCase(super.repository);
}
