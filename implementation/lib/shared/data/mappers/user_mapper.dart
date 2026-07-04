// lib/shared/data/mappers/user_mapper.dart
import 'package:zamaan/shared/data/mappers/base_data_mapper.dart';
import 'package:zamaan/shared/data/models/local/user/user_hive_model.dart';
import 'package:zamaan/shared/domain/entities/user_entity.dart';

/// Mapper responsible for converting between [UserEntity] and [UserHiveModel].
///
/// Handles bidirectional transformations:
/// - [toLocalModel]: Converts [UserEntity] to [UserHiveModel] for local persistence via Hive.
/// - [toEntityFromLocal]: Reconstructs [UserEntity] from [UserHiveModel] loaded from Hive.
/// - [toRemoteModel]: Not implemented as remote sync is not yet supported.
///
/// This mapper ensures clean separation between domain logic and data layer representations,
/// maintaining type safety and consistency across local data operations.
class UserMapper extends BaseDataMapper<UserEntity, UserHiveModel, void> {
  @override
  UserHiveModel toLocalModel(UserEntity entity) => UserHiveModel(
    id: entity.id,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    displayName: entity.displayName,
    avatarPath: entity.avatarPath,
    registrationStatus: entity.registrationStatus,
    remoteUserId: entity.remoteUserId,
    email: entity.email,
    description: entity.description,
    order: entity.order,
  );

  @override
  void toRemoteModel(UserEntity entity) {}

  @override
  UserEntity toEntityFromLocal(UserHiveModel model) => UserEntity(
    id: model.id,
    createdAt: model.createdAt,
    updatedAt: model.updatedAt,
    displayName: model.displayName,
    avatarPath: model.avatarPath,
    registrationStatus: model.registrationStatus,
    remoteUserId: model.remoteUserId,
    email: model.email,
    description: model.description,
    order: model.order,
  );

  @override
  UserEntity toEntityFromRemote(void remote) => throw UnimplementedError();
}
