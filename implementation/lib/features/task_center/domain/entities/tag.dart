import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zamaan/features/task_center/domain/entities/category.dart';

/// A specialized category used for labeling and organizing tasks with visual markers.
///
/// Extends [CategoryEntity] to add tag-specific functionality while maintaining
/// core category properties. Tags are typically used for filtering, grouping,
/// and quick visual identification of related tasks.
///
/// ## Example Usage
/// ```dart
/// TagEntity(
///   id: "tag_123",
///   title: "Urgent",
///   colorCode: "#FF0000", // Red color
///   iconCode: "🚨", // Alarm emoji
///   userId: "user_456",
///   createdAt: DateTime(2023, 10, 15),
///   description: "High priority items",
///   updatedAt: DateTime(2023, 10, 16),
/// )
/// ```
///
/// ## Relationships
/// - Typically associated with [TaskEntity] through [TaskEntity.fixedTagIds]
/// - Inherits all properties from [CategoryEntity]
class TagEntity extends CategoryEntity {
  //========================
  // Constructors
  //========================

  /// Base constructor for fully initialized entity.
  TagEntity({
    required super.id,
    required super.userId,
    required this.taskId,
    required super.createdAt,
    required super.description,
    required super.updatedAt,
    required super.title,
    required super.colorCode,
    required super.iconCode,
    super.order,
  });

  /// Named constructor for creating a new entity.
  ///
  /// Automatically generates `id` and `createdAt` in the domain layer.
  TagEntity.create({
    required super.userId,
    required this.taskId,
    required super.title,
    required super.colorCode,
    required super.iconCode,
    super.description,
    super.order,
  }) : super.create();

  /// Named constructor for updating an existing entity.
  ///
  /// Requires all fields explicitly, including `id` and `createdAt`.
  /// Does not include `updatedAt`.
  TagEntity.update({
    required super.id,
    required super.userId,
    required this.taskId,
    required super.createdAt,
    required super.title,
    required super.colorCode,
    required super.iconCode,
    super.description,
    super.order,
  }) : super.update();

  //========================
  // Factories
  //========================

  /// Factory to create a new TagEntity from input data.
  factory TagEntity.createFromData({
    required String userId,
    required String taskId,
    required String title,
    required int colorCode,
    required int iconCode,
    String? description,
    int? order,
  }) => TagEntity.create(
    userId: userId,
    taskId: taskId,
    title: title,
    colorCode: colorCode,
    iconCode: iconCode,
    description: description,
    order: order,
  );

  /// Factory to create an updated TagEntity from input data.
  factory TagEntity.updateFromData({
    required TagEntity old,
    String? title,
    int? colorCode,
    int? iconCode,
    String? description,
    int? order,
  }) {
    return TagEntity.update(
      id: old.id,
      userId: old.userId,
      createdAt: old.createdAt,
      title: title ?? old.title,
      colorCode: colorCode ?? old.colorCode,
      iconCode: iconCode ?? old.iconCode,
      description: description ?? old.description,
      order: order ?? old.order,
      taskId: old.taskId,
    );
  }

  @HiveField(14)
  final String? taskId;

  @override
  TagEntity copyWith({
    String? id,
    String? taskId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? title,
    int? colorCode,
    int? iconCode,
    int? order,
  }) => TagEntity(
    id: id ?? this.id,
    taskId: taskId ?? this.taskId,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    colorCode: colorCode ?? this.colorCode,
    iconCode: iconCode ?? this.iconCode,
    order: order ?? this.order,
  );
}
