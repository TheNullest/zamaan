import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_interval.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_interval_repository.dart';
import 'package:zamaan/shared/domain/use_cases/create_use_case.dart';

/// Creates a new scheduled interval definition.
class CreateScheduledIntervalUseCase
    extends CreateUseCase<ScheduledIntervalRepository, ScheduledIntervalEntity> {
  CreateScheduledIntervalUseCase(super.repository);
}
