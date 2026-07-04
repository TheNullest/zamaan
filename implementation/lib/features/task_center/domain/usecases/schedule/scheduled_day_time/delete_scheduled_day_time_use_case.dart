import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_day_time_repository.dart';
import 'package:zamaan/shared/domain/use_cases/delete_use_case.dart';

/// Deletes a scheduled day-time pattern.
class DeleteScheduledDayTimeUseCase extends DeleteUseCase<ScheduledDayTimeRepository> {
  DeleteScheduledDayTimeUseCase(super.repository);
}
