import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/time_range.dart';
import 'package:zamaan/features/task_center/domain/repositories/schedule/time_range_repository.dart';
import 'package:zamaan/shared/domain/use_cases/base_use_case.dart';

/// Retrieves time ranges for a specific parent entity.
class GetTimeRangesForParentUseCase
    extends UseCaseWithParams<TimeRangeRepository, List<TimeRangeEntity>, String> {
  GetTimeRangesForParentUseCase(super.repository);

  @override
  EResultFuture<List<TimeRangeEntity>> call(String params) async =>
      repository.getByParentId(params);
}
