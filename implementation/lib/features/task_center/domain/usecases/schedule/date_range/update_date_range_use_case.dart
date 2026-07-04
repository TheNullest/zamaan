import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/date_range.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/date_range_repository.dart';
import 'package:zamaan/shared/domain/use_cases/update_use_case.dart';

/// Updates an existing date range definition.
class UpdateDateRangeUseCase extends UpdateUseCase<DateRangeEntity, DateRangeRepository> {
  UpdateDateRangeUseCase(super.repository);
}
