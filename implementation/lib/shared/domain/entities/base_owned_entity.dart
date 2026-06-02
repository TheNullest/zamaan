import 'package:zamaan/shared/domain/entities/base_entity.dart';

/// A specialized base class for entities that belong to a specific user.
///
/// Use this for Tasks, Goals, Schedules, etc.
abstract class BaseOwnedEntity extends BaseEntity {
  BaseOwnedEntity({
    required super.id,
    required super.createdAt,
    required this.userId,
    super.description,
    super.updatedAt,
    super.order,
  });

  BaseOwnedEntity.create({required this.userId, super.description, super.order}) : super.create();

  BaseOwnedEntity.update({
    required super.id,
    required super.createdAt,
    required this.userId,
    super.description,
    super.order,
  }) : super.update();

  /// The ID of the owner of this entity.
  /// Used for filtering data and syncing with remote databases.
  final String userId;

  @override
  List<Object?> get props => [...super.props, userId];
}
