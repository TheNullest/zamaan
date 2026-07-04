import 'package:zamaan/shared/data/datasources/local/base_local_data_source.dart';
import 'package:zamaan/shared/data/models/local/bases/base_owned_local_model.dart';

abstract class TagLocalDataSource<Model extends BaseOwnedLocalModel>
    extends BaseLocalDataSource<Model> {}
