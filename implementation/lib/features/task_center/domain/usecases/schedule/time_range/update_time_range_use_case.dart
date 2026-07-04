import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/time_range.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/time_range_repository.dart';
import 'package:zamaan/shared/domain/use_cases/update_use_case.dart';

/// Updates an existing time range definition.
class UpdateTimeRangeUseCase extends UpdateUseCase<TimeRangeEntity, TimeRangeRepository> {
  UpdateTimeRangeUseCase(super.repository);
}
