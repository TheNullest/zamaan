import 'package:zamaan/features/task_center/domain/repositories/schedule/date_range_repository.dart';
import 'package:zamaan/shared/domain/use_cases/delete_use_case.dart';

/// Deletes a date range definition.
class DeleteDateRangeUseCase extends DeleteUseCase<DateRangeRepository> {
  DeleteDateRangeUseCase(super.repository);
}
