import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_occurrence.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_occurrence_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

/// Retrieves scheduled occurrences for a specific task.
class GetScheduledOccurrencesForTaskUseCase
    extends
        UseCaseWithParams<ScheduledOccurrenceRepository, List<ScheduledOccurrenceEntity>, String> {
  GetScheduledOccurrencesForTaskUseCase(super.repository);

  @override
  EResultFuture<List<ScheduledOccurrenceEntity>> call(String params) async =>
      repository.getByTaskId(params);
}
