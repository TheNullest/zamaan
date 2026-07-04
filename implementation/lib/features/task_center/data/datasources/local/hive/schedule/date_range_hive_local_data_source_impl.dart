import 'package:dartz/dartz.dart';
import 'package:zamaan/core/utils/to_failure_either.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/features/task_center/data/datasources/local/bases/schedule/date_range_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/schedule/date_range_hive_model.dart';
import 'package:zamaan/shared/data/datasources/local/base_hive_local_data_source_impl.dart';

class DateRangeHiveLocalDataSourceImpl extends BaseHiveLocalDataSourceImpl<DateRangeHiveModel>
    implements DateRangeLocalDataSource<DateRangeHiveModel> {
  DateRangeHiveLocalDataSourceImpl({required super.box});

  @override
  EResultFuture<List<DateRangeHiveModel>> getByParentId({
    required String parentId,
    required String userId,
  }) async {
    try {
      final filtered = box.values
          .where((model) => model.ownerId == userId && model.parentId == parentId)
          .toList();
      return Right(filtered);
    } catch (e, st) {
      return toFailureEither<List<DateRangeHiveModel>>(e: e, stackTrace: st);
    }
  }
}
