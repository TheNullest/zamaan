import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_interval_repository.dart';
import 'package:zamaan/shared/domain/use_cases/delete_use_case.dart';

/// Deletes a scheduled interval definition.
class DeleteScheduledIntervalUseCase extends DeleteUseCase<ScheduledIntervalRepository> {
  DeleteScheduledIntervalUseCase(super.repository);
}
