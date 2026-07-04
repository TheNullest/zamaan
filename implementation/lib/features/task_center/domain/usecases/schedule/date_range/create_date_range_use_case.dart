import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/date_range.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/date_range_repository.dart';
import 'package:zamaan/shared/domain/use_cases/create_use_case.dart';

/// Creates a new date range definition.
class CreateDateRangeUseCase extends CreateUseCase<DateRangeRepository, DateRangeEntity> {
  CreateDateRangeUseCase(super.repository);
}
