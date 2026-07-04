import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/data/datasources/local/base_local_data_source.dart';
import 'package:zamaan/shared/data/models/local/bases/base_owned_local_model.dart';

abstract class DateRangeLocalDataSource<Model extends BaseOwnedLocalModel>
    extends BaseLocalDataSource<Model> {
  /// Retrieves all date ranges belonging to a specific parent entity (e.g., a schedule constraint).
  EResultFuture<List<Model>> getByParentId({required String parentId, required String userId});
}
