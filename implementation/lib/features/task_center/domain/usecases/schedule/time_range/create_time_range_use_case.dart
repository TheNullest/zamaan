import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/time_range.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/time_range_repository.dart';
import 'package:zamaan/shared/domain/use_cases/create_use_case.dart';

/// Creates a new time range definition.
class CreateTimeRangeUseCase extends CreateUseCase<TimeRangeRepository, TimeRangeEntity> {
  CreateTimeRangeUseCase(super.repository);
}
