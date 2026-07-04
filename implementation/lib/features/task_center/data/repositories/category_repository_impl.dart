import 'package:zamaan/features/task_center/data/datasources/local/bases/category_local_data_source.dart';
import 'package:zamaan/features/task_center/data/models/local/category_hive_model.dart';
import 'package:zamaan/features/task_center/domain/entities/category.dart';
import 'package:zamaan/features/task_center/domain/repositories/category_repository.dart';
import 'package:zamaan/shared/data/repositories/base_owned_repository_impl.dart';
import 'package:zamaan/shared/domain/enums/entity_type.dart';

class CategoryRepositoryImpl
    extends
        BaseOwnedRepositoryImpl<
          CategoryEntity,
          CategoryHiveModel,
          CategoryLocalDataSource<CategoryHiveModel>
        >
    implements CategoryRepository {
  CategoryRepositoryImpl({
    required super.localDataSource,
    required super.dataMapper,
    required super.currentUserProvider,
  }) : super(entityType: EntityType.category);
}
