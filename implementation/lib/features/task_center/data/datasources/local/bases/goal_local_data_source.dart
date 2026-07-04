// lib/features/task_center/data/datasources/local/goal_local_data_source.dart
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/datasources/local/base_local_data_source.dart';
import 'package:zamaan/shared/data/models/local/bases/base_owned_local_model.dart';
import 'package:zamaan/shared/domain/enums/hive/reference_type.dart';

abstract class GoalLocalDataSource<Model extends BaseOwnedLocalModel>
    extends BaseLocalDataSource<Model> {
  EResultFuture<List<Model>> getByReference({
    required String refId,
    required ReferenceType refType,
    required String userId,
  });
}
