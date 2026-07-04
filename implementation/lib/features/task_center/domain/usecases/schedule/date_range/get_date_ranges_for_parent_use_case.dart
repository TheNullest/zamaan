import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/date_range.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/date_range_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

/// Retrieves date ranges for a specific parent entity.
class GetDateRangesForParentUseCase
    extends UseCaseWithParams<DateRangeRepository, List<DateRangeEntity>, String> {
  GetDateRangesForParentUseCase(super.repository);

  @override
  EResultFuture<List<DateRangeEntity>> call(String params) async =>
      repository.getByParentId(params);
}
