import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/scheduled_occurrence.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';

/// Repository for [ScheduledOccurrenceEntity] operations.
abstract class ScheduledOccurrenceRepository extends BaseRepository<ScheduledOccurrenceEntity> {
  /// Retrieves all scheduled occurrences for the given [taskId].
  EResultFuture<List<ScheduledOccurrenceEntity>> getByTaskId(String taskId);
}
