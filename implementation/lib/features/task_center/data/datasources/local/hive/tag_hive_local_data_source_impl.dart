import 'package:zamaan/features/task_center/data/datasources/local/bases/tag_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/tag_hive_model.dart';
import 'package:zamaan/shared/data/datasources/local/base_hive_local_data_source_impl.dart';

class TagHiveLocalDataSourceImpl extends BaseHiveLocalDataSourceImpl<TagHiveModel>
    implements TagLocalDataSource<TagHiveModel> {
  TagHiveLocalDataSourceImpl({required super.box});
}
