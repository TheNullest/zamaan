import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/schedule/scheduled_day_time_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/scheduled_day_time_hive_model.dart';
import 'package:zamaan/shared/data/datasources/local/base_hive_local_data_source_impl.dart';

class ScheduledDayTimeHiveLocalDataSourceImpl
    extends BaseHiveLocalDataSourceImpl<ScheduledDayTimeHiveModel>
    implements ScheduledDayTimeLocalDataSource<ScheduledDayTimeHiveModel> {
  ScheduledDayTimeHiveLocalDataSourceImpl({required super.box});

  @override
  EResultFuture<List<ScheduledDayTimeHiveModel>> getByTaskId({
    required String taskId,
    required String userId,
  }) async {
    try {
      final filtered = box.values
          .where((model) => model.ownerId == userId && model.taskId == taskId)
          .toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<ScheduledDayTimeHiveModel>>(e: e, stackTrace: st);
    }
  }
}
