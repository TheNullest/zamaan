import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_interval.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_interval_repository.dart';
import 'package:zamaan/shared/domain/use_cases/update_use_case.dart';

/// Updates an existing scheduled interval definition.
class UpdateScheduledIntervalUseCase
    extends UpdateUseCase<ScheduledIntervalEntity, ScheduledIntervalRepository> {
  UpdateScheduledIntervalUseCase(super.repository);
}
