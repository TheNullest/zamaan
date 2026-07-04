import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/time_range.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';

/// Repository for [TimeRangeEntity] operations.
abstract class TimeRangeRepository extends BaseRepository<TimeRangeEntity> {
  /// Retrieves all time ranges attached to the given parent entity.
  EResultFuture<List<TimeRangeEntity>> getByParentId(String parentId);
}
