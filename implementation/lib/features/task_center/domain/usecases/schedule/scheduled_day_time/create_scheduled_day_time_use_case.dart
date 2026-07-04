import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_day_time.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/scheduled_day_time_repository.dart';
import 'package:zamaan/shared/domain/use_cases/create_use_case.dart';

/// Creates a new scheduled day-time pattern.
class CreateScheduledDayTimeUseCase
    extends CreateUseCase<ScheduledDayTimeRepository, ScheduledDayTimeEntity> {
  CreateScheduledDayTimeUseCase(super.repository);
}
