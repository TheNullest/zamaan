import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/schedule/scheduled_occurrence_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/scheduled_occurrence_hive_model.dart';
import 'package:zamaan/shared/data/datasources/local/base_hive_local_data_source_impl.dart';

class ScheduledOccurrenceHiveLocalDataSourceImpl
    extends BaseHiveLocalDataSourceImpl<ScheduledOccurrenceHiveModel>
    implements ScheduledOccurrenceLocalDataSource<ScheduledOccurrenceHiveModel> {
  ScheduledOccurrenceHiveLocalDataSourceImpl({required super.box});

  @override
  EResultFuture<List<ScheduledOccurrenceHiveModel>> getByTaskId({
    required String taskId,
    required String userId,
  }) async {
    try {
      final filtered = box.values
          .where((model) => model.ownerId == userId && model.taskId == taskId)
          .toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<ScheduledOccurrenceHiveModel>>(e: e, stackTrace: st);
    }
  }

  @override
  EResultFuture<List<ScheduledOccurrenceHiveModel>> getByDateRange({
    required DateTime startDate,
    required DateTime endDate,
    required String userId,
  }) async {
    try {
      final filtered = box.values.where((model) {
        if (model.ownerId != userId) return false;
        // Occurrence overlaps the range if its startDateTime is before endDate
        // and its endDateTime is after startDate.
        return model.startDateTime.isBefore(endDate) && (model.endDateTime.isAfter(startDate));
      }).toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<ScheduledOccurrenceHiveModel>>(e: e, stackTrace: st);
    }
  }
}
