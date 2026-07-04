import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/date_range.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';

/// Repository for [DateRangeEntity] operations.
abstract class DateRangeRepository extends BaseRepository<DateRangeEntity> {
  /// Retrieves all date ranges attached to the given parent entity.
  EResultFuture<List<DateRangeEntity>> getByParentId(String parentId);
}
