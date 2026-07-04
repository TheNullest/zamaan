import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_occurrence.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_occurrence_repository.dart';
import 'package:zamaan/shared/domain/use_cases/update_use_case.dart';

/// Updates an existing scheduled occurrence entry.
class UpdateScheduledOccurrenceUseCase
    extends UpdateUseCase<ScheduledOccurrenceEntity, ScheduledOccurrenceRepository> {
  UpdateScheduledOccurrenceUseCase(super.repository);
}
