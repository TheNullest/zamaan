import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/domain/entities/goal.dart';
import 'package:zamaan/shared/domain/enums/hive/reference_type.dart';
import 'package:zamaan/shared/domain/repositories/base_repository.dart';

abstract class GoalRepository extends BaseRepository<GoalEntity> {
  EResultFuture<List<GoalEntity>> getByReference({
    required String refId,
    required ReferenceType refType,
  });
}
