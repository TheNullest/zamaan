import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zamaan/shared/domain/entities/base_owned_entity.dart';

/// Represents a generic category for organizing application entities (tasks, notes, etc.),
/// with visual customization capabilities.
///
/// ## Example Usage
/// ```dart
/// CategoryEntity(
///   title: "Work Projects",
///   colorCode: 0xFF4285F4, // Google Blue
///   iconCode: 0xe3c9, // Material Icons "work" code point
///   id: "cat_123",
///   userId: "user_456",
///   createdAt: DateTime(2023, 10, 15),
///   description: "Professional development tasks",
///   updatedAt: DateTime(2023, 10, 16),
/// )
/// ```
///
/// ## Behavior
/// - Categories can be extended for specialized uses (e.g., [TagEntity])
/// - Color codes use ARGB format (0xAARRGGBB)
/// - Icon codes typically reference Material Design icon code points
class CategoryEntity extends BaseOwnedEntity {
  // ------------------------------------------------------------
  // BASE CONSTRUCTOR (rehydration from persistence)
  // ------------------------------------------------------------
  CategoryEntity({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.title,
    required this.colorCode,
    required this.iconCode,
    super.description,
    super.updatedAt,
    super.order,
  });

  // ------------------------------------------------------------
  // CREATE CONSTRUCTOR (domain-controlled initialization)
  // ------------------------------------------------------------
  CategoryEntity.create({
    required super.userId,
    required this.title,
    required this.colorCode,
    required this.iconCode,
    super.description,
    super.order,
  }) : super.create();

  // ------------------------------------------------------------
  // UPDATE CONSTRUCTOR (preserves id + createdAt, injects updatedAt)
  // ------------------------------------------------------------
  CategoryEntity.update({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.title,
    required this.colorCode,
    required this.iconCode,
    super.description,
    super.order,
  }) : super.update();

  // ------------------------------------------------------------
  // FACTORIES — CREATION
  // ------------------------------------------------------------

  factory CategoryEntity.createFromData({
    required String userId,
    required String title,
    required int colorCode,
    required int iconCode,
    String? description,
    int? order,
  }) => CategoryEntity.create(
    userId: userId,
    title: title,
    colorCode: colorCode,
    iconCode: iconCode,
    description: description,
    order: order,
  );

  // ------------------------------------------------------------
  // FACTORIES — UPDATE
  // ------------------------------------------------------------

  factory CategoryEntity.updateFromData({
    required CategoryEntity old,
    String? title,
    int? colorCode,
    int? iconCode,
    String? description,
    int? order,
  }) {
    return CategoryEntity.update(
      id: old.id,
      userId: old.userId,
      createdAt: old.createdAt,
      title: title ?? old.title,
      colorCode: colorCode ?? old.colorCode,
      iconCode: iconCode ?? old.iconCode,
      description: description ?? old.description,
      order: order ?? old.order,
    );
  }

  /// The display name of the category
  ///
  /// Example: "Personal Errands"
  @HiveField(11)
  final String title;

  /// ARGB color value for visual identification
  ///
  /// Format: 0xAARRGGBB
  /// - AA = Alpha (00-FF)
  /// - RR = Red (00-FF)
  /// - GG = Green (00-FF)
  /// - BB = Blue (00-FF)
  ///
  /// Example: 0xFF2196F3 (Material Blue 500)
  @HiveField(12)
  final int colorCode;

  /// Icon identifier using Material Design code points
  ///
  /// Find codes at: https://fonts.google.com/icons
  /// Example: 0xe318 → "light_mode" icon
  @HiveField(13)
  final int iconCode;

  CategoryEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? title,
    int? colorCode,
    int? iconCode,
    int? order,
  }) => CategoryEntity(
    id: id ?? this.id,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    colorCode: colorCode ?? this.colorCode,
    iconCode: iconCode ?? this.iconCode,
    order: order ?? this.order,
  );

  @override
  List<Object?> get props => [...super.props, title, colorCode, iconCode];
}
