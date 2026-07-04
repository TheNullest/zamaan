import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/schedule/schedule_constraints.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';

abstract class ScheduleConstraintsRepository extends BaseRepository<ScheduleConstraintsEntity> {
  EResultFuture<List<ScheduleConstraintsEntity>> getByTaskId(String taskId);
}


