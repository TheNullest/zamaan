// lib/features/task_center/data/datasources/local/goal_local_data_source_impl.dart

import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/goal_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/goal_hive_model.dart';
import 'package:zamaan/shared/data/datasources/local/base_hive_local_data_source_impl.dart';
import 'package:zamaan/shared/domain/enums/hive/reference_type.dart';

class GoalHiveLocalDataSourceImpl extends BaseHiveLocalDataSourceImpl<GoalHiveModel>
    implements GoalLocalDataSource<GoalHiveModel> {
  GoalHiveLocalDataSourceImpl({required super.box});

  @override
  EResultFuture<List<GoalHiveModel>> getByReference({
    required String refId,
    required ReferenceType refType,
    required String userId,
  }) async {
    try {
      final filtered = box.values
          .where((m) => m.ownerId == userId && m.refId == refId && m.refType == refType)
          .toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<GoalHiveModel>>(e: e, stackTrace: st);
    }
  }
}
