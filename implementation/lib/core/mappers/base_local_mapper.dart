import 'package:zamaan/shared/domain/entities/base_entity.dart';

abstract class BaseLocalMapper<TEntity extends BaseEntity, TLocalModel> {
  TLocalModel toLocal(TEntity entity);
  TEntity toEntity(TLocalModel local);
}
