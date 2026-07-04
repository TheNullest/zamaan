import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_day_time.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_day_time_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

/// Retrieves scheduled day-time patterns for a specific task.
class GetScheduledDayTimesForTaskUseCase
    extends UseCaseWithParams<ScheduledDayTimeRepository, List<ScheduledDayTimeEntity>, String> {
  GetScheduledDayTimesForTaskUseCase(super.repository);

  @override
  EResultFuture<List<ScheduledDayTimeEntity>> call(String params) async =>
      repository.getByTaskId(params);
}
