import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_day_time.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_day_time_repository.dart';
import 'package:zamaan/shared/domain/use_cases/update_use_case.dart';

/// Updates an existing scheduled day-time pattern.
class UpdateScheduledDayTimeUseCase
    extends UpdateUseCase<ScheduledDayTimeEntity, ScheduledDayTimeRepository> {
  UpdateScheduledDayTimeUseCase(super.repository);
}
