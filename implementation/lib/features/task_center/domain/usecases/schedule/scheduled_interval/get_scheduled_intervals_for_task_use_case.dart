import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_interval.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_interval_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

/// Retrieves scheduled intervals for a specific task.
class GetScheduledIntervalsForTaskUseCase
    extends UseCaseWithParams<ScheduledIntervalRepository, List<ScheduledIntervalEntity>, String> {
  GetScheduledIntervalsForTaskUseCase(super.repository);

  @override
  EResultFuture<List<ScheduledIntervalEntity>> call(String params) async =>
      repository.getByTaskId(params);
}
