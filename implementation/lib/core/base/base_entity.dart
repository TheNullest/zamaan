import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zamaan/core/utils/uuid.dart';

/// An abstract base class for entities, providing common fields and functionality.
///
/// It includes the following fields:
/// - `id`: The unique identifier for the entity, automatically generated if not provided.
/// - `userId`: The ID of the creator of the entity, if any.
/// - `createdAt`: The timestamp when the entity was created, automatically set if not provided.
/// - `description`: A description of the entity, if any.
/// - `updatedAt`: The timestamp when the entity was last updated, can be null if not updated.
abstract class BaseEntity with EquatableMixin {
  BaseEntity({
    required this.id,
    required this.createdAt,
    this.description,
    this.updatedAt,
    this.order,
  });

  BaseEntity.create({this.description, this.order})
    : id = uuidGenerator,
      createdAt = DateTime.now(),
      updatedAt = null;

  BaseEntity.update({required this.id, required this.createdAt, this.description, this.order})
    : updatedAt = DateTime.now();

  /// Creates a new `BaseEntityAbstraction` with the specified properties.
  ///
  /// The `id` and `createdAt` fields are automatically generated if not provided.
  /// The `order`, `userId`, and `description` fields are optional.

  /// The unique identifier for the entity.
  ///
  /// This field is automatically generated using `uuidGenerator` if not provided.
  @HiveField(0)
  final String id;

  /// The timestamp when the entity was created.
  ///
  /// This field is automatically set to the current date and time if not provided.
  @HiveField(2)
  final DateTime createdAt;

  /// A description of the entity.
  @HiveField(3)
  final String? description;

  /// The timestamp when the entity was last updated.
  ///
  /// This field can be null if the entity has not been updated since creation,
  /// it should be set when the entity is updated.
  @HiveField(4)
  final DateTime? updatedAt;

  @HiveField(5)
  final int? order;

  // Default validation logic for base fields
  // @protected
  void validateFields() {
    final errors = <String>[];

    if (description != null && description!.length > 500) {
      errors.add('Description cannot exceed 500 characters.');
    }
  }

  @override
  List<Object?> get props => [id, updatedAt, description, createdAt];
}
