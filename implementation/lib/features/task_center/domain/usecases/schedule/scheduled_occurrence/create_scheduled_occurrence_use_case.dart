import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_occurrence.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_occurrence_repository.dart';
import 'package:zamaan/shared/domain/use_cases/create_use_case.dart';

/// Creates a new scheduled occurrence entry.
class CreateScheduledOccurrenceUseCase
    extends CreateUseCase<ScheduledOccurrenceRepository, ScheduledOccurrenceEntity> {
  CreateScheduledOccurrenceUseCase(super.repository);
}
