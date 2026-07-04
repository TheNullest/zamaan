import 'package:zamaan/features/task_center/domain/repositories/schedule/time_range_repository.dart';
import 'package:zamaan/shared/domain/use_cases/delete_use_case.dart';

/// Deletes a time range definition.
class DeleteTimeRangeUseCase extends DeleteUseCase<TimeRangeRepository> {
  DeleteTimeRangeUseCase(super.repository);
}
