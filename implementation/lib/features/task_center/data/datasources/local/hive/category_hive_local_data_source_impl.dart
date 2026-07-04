import 'package:zamaan/features/task_center/data/datasources/local/bases/category_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/category_hive_model.dart';
import 'package:zamaan/shared/data/datasources/local/base_hive_local_data_source_impl.dart';

class CategoryHiveLocalDataSourceImpl extends BaseHiveLocalDataSourceImpl<CategoryHiveModel>
    implements CategoryLocalDataSource<CategoryHiveModel> {
  CategoryHiveLocalDataSourceImpl({required super.box});
}
