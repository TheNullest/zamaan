import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_day_time.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';

/// Repository for [ScheduledDayTimeEntity] operations.
abstract class ScheduledDayTimeRepository extends BaseRepository<ScheduledDayTimeEntity> {
  /// Retrieves all scheduled day-time definitions for the given [taskId].
  EResultFuture<List<ScheduledDayTimeEntity>> getByTaskId(String taskId);
}
