import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_occurrence_repository.dart';
import 'package:zamaan/shared/domain/use_cases/delete_use_case.dart';

/// Deletes a scheduled occurrence entry.
class DeleteScheduledOccurrenceUseCase extends DeleteUseCase<ScheduledOccurrenceRepository> {
  DeleteScheduledOccurrenceUseCase(super.repository);
}
