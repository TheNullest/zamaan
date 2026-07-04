import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_interval.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';

/// Repository for [ScheduledIntervalEntity] operations.
abstract class ScheduledIntervalRepository extends BaseRepository<ScheduledIntervalEntity> {
  /// Retrieves all scheduled interval definitions for the given [taskId].
  EResultFuture<List<ScheduledIntervalEntity>> getByTaskId(String taskId);
}
