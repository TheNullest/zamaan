// lib/features/task_center/data/datasources/local/scheduled_occurrence_local_data_source.dart
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/datasources/local/base_local_data_source.dart';
import 'package:zamaan/shared/data/models/local/bases/base_owned_local_model.dart';

abstract class ScheduledOccurrenceLocalDataSource<Model extends BaseOwnedLocalModel>
    extends BaseLocalDataSource<Model> {
  /// Retrieves all occurrences belonging to a specific [taskId].
  EResultFuture<List<Model>> getByTaskId({required String taskId, required String userId});

  /// Retrieves occurrences that fall within a given date range.
  ///
  /// The range is inclusive of [startDate] and exclusive of [endDate] (or as per implementation).
  EResultFuture<List<Model>> getByDateRange({
    required DateTime startDate,
    required DateTime endDate,
    required String userId,
  });
}
