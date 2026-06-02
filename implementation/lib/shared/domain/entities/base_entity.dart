// lib/domain/entities/base_entity.dart
import 'package:equatable/equatable.dart';
import 'package:zamaan/core/utils/uuid.dart';

/// Abstract base class for all domain entities.
///
/// This class is part of the **domain layer** and must remain completely
/// independent of any external frameworks (no Hive, no JSON, no Flutter).
/// It contains only business‑relevant fields and validation logic.
///
/// ## Fields
/// - [id]: Unique identifier (UUID), generated automatically for new entities.
/// - [createdAt]: Timestamp when the entity was first created.
/// - [updatedAt]: Timestamp of the last update (null if never updated).
/// - [description]: Optional textual description (max 500 characters).
/// - [order]: Optional integer for sorting (e.g., task order in a list).
///
/// ## Constructors
/// - [BaseEntity.create]: Creates a new entity with auto‑generated [id] and [createdAt].
/// - [BaseEntity.update]: Creates an updated copy of an existing entity, setting [updatedAt] to now.
///
/// ## Validation
/// Call [validate()] after creation to ensure invariants hold.
abstract class BaseEntity with EquatableMixin {
  final String id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? description;
  final int? order;

  BaseEntity({
    required this.id,
    required this.createdAt,
    this.updatedAt,
    this.description,
    this.order,
  });

  /// Creates a new entity (id and createdAt are auto‑generated).
  BaseEntity.create({this.description, this.order})
    : id = uuidGenerator,
      createdAt = DateTime.now(),
      updatedAt = null;

  /// Creates an updated version of an existing entity (updatedAt set to now).
  BaseEntity.update({required this.id, required this.createdAt, this.description, this.order})
    : updatedAt = DateTime.now();

  /// Validates the entity's state.
  ///
  /// Throws an [ArgumentError] if any rule is violated.
  void validate() {
    final errors = <String>[];
    if (description != null && description!.length > 500) {
      errors.add('Description cannot exceed 500 characters.');
    }
    if (errors.isNotEmpty) {
      throw ArgumentError(errors.join('\n'));
    }
  }

  @override
  List<Object?> get props => [id, createdAt, updatedAt, description, order];
}
