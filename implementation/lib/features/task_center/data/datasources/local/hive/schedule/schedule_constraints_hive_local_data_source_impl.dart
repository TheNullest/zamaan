import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/schedule/schedule_constraints_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/schedule_constraints_hive_model.dart';
import 'package:zamaan/shared/data/datasources/local/base_hive_local_data_source_impl.dart';

class ScheduleConstraintsHiveLocalDataSourceImpl
    extends BaseHiveLocalDataSourceImpl<ScheduleConstraintsHiveModel>
    implements ScheduleConstraintsLocalDataSource<ScheduleConstraintsHiveModel> {
  ScheduleConstraintsHiveLocalDataSourceImpl({required super.box});

  @override
  EResultFuture<List<ScheduleConstraintsHiveModel>> getByTaskId({
    required String taskId,
    required String userId,
  }) async {
    try {
      final filtered = box.values.where((m) => m.ownerId == userId && m.taskId == taskId).toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<ScheduleConstraintsHiveModel>>(e: e, stackTrace: st);
    }
  }
}
