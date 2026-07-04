import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zamaan/shared/domain/entities/base_owned_entity.dart';

/// Represents a measurement unit used within the application for quantifying values.
///
/// The [CustomMeasurementUnitEntity] encapsulates details about various measurement units.
/// Each instance stores:
/// - **[title]**: The descriptive name of the measurement unit (e.g., "Meter", "Kilogram").
/// - **[isDouble]**: A flag indicating whether the measurement unit supports decimal values.
/// - **[iconCode]**: An integer code that identifies an icon for visual representation in the VM.
///
/// This entity extends [BaseOwnedEntity], inheriting common properties such as [id],
/// [userId], [createdAt], [updatedAt], and [description].
///
/// **Example:**
/// ```dart
/// final customMeasurementUnitId = CustomeMeasurementUnitEntity(
///   id: 'unit_001',
///   userId: 'user_789',
///   createdAt: DateTime.now(),
///   updatedAt: DateTime.now(),
///   description: 'Unit for measuring distances',
///   title: 'Meter',
///   isDouble: true,
///   iconCode: 0x1F6FA, // Sample icon code
/// );
/// ```
class CustomMeasurementUnitEntity extends BaseOwnedEntity {
  /// Creates a [CustomMeasurementUnitEntity] with the provided properties.
  ///
  /// - [title]: The name of the measurement unit (for example, "Meter" or "Kilogram").
  /// - [isDouble]: If true, values for this measurement unit are expected to be stored as doubles.
  /// - [iconCode]: An integer code representing an associated icon for the measurement unit.

  //========================
  // Constructors
  //========================

  /// Base constructor for fully initialized measurement unit (usually used internally).
  CustomMeasurementUnitEntity({
    required super.id,
    required super.userId,
    required super.createdAt,
    required super.description,
    required this.title,
    required this.isDouble,
    required this.iconCode,
    super.updatedAt,
    super.order,
  });

  /// Named constructor for creating a new measurement unit.
  ///
  /// Automatically generates `id` and `createdAt` in the domain layer.
  /// `description` is optional.
  CustomMeasurementUnitEntity.create({
    required super.userId,
    required this.title,
    required this.isDouble,
    required this.iconCode,
    super.description,
    super.order,
  }) : super.create();

  /// Named constructor for updating an existing measurement unit.
  ///
  /// Requires all fields explicitly, including `id` and `createdAt`.
  CustomMeasurementUnitEntity.update({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.title,
    required this.isDouble,
    required this.iconCode,
    super.description,
    super.order,
  }) : super.update();

  //========================
  // Factories
  //========================

  /// Factory to create a measurement unit from basic input data.
  ///
  /// Simplifies initialization for UI or service layers.
  factory CustomMeasurementUnitEntity.createFromData({
    required String userId,
    required String title,
    required bool isDouble,
    required int iconCode,
    String? description,
    int? order,
  }) => CustomMeasurementUnitEntity.create(
    userId: userId,
    title: title,
    isDouble: isDouble,
    iconCode: iconCode,
    description: description,
    order: order,
  );

  /// Factory to create an updated CustomMeasurementUnitEntity from input data.
  factory CustomMeasurementUnitEntity.updateFromData({
    required String id,
    required String userId,
    required DateTime createdAt,
    required String title,
    required bool isDouble,
    required int iconCode,
    String? description,
    int? order,
  }) => CustomMeasurementUnitEntity.update(
    id: id,
    userId: userId,
    createdAt: createdAt,
    title: title,
    isDouble: isDouble,
    iconCode: iconCode,
    description: description,
    order: order,
  );

  /// A human-readable title for the measurement unit.
  @HiveField(11)
  final String title;

  /// Indicates whether values for this measurement unit should be stored as doubles.
  @HiveField(12)
  final bool isDouble;

  /// An integer code representing the icon resource associated with this measurement unit.
  @HiveField(13)
  final int iconCode;

  CustomMeasurementUnitEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? title,
    String? description,
    int? iconCode,
    bool? isDouble,
    int? order,
  }) => CustomMeasurementUnitEntity(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    description: description ?? this.description,
    iconCode: iconCode ?? this.iconCode,
    isDouble: isDouble ?? this.isDouble,
    order: order ?? this.order,
  );

  @override
  List<Object?> get props => [...super.props, title, isDouble, iconCode];
}
