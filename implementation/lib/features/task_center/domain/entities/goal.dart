import 'package:zamaan/core/base/base_owned_entity.dart';
import 'package:zamaan/shared/domain/enums/hive/goal_constraint.dart';
import 'package:zamaan/shared/domain/enums/hive/measurement_unit.dart';
import 'package:zamaan/shared/domain/enums/hive/reference_type.dart';
import 'package:zamaan/shared/domain/enums/hive/repetition_type.dart';

/// Represents a measurable target associated with specific tasks or activities.
///
/// Tracks progress requirements across different time periods and constraints,
/// supporting both system-defined and custom measurement units.
///
/// # Examples
///
/// **Fitness Goal**:
/// ```dart
/// GoalEntity(
///   id: 'fit_goal_1',
///   userId: 'user_789',
///   description: 'Daily exercise target',
///   refType: ReferenceType.task,
///   refId: 'task_gym',
///   measurementUnit: MeasurementUnit.count,
///   goalConstraint: GoalConstraint.min,
///   hourlyTarget: 5,       // 5 pushups per active hour
///   dailyTarget: 50,       // Minimum 50 pushups daily
///   weeklyTarget: 350,     // Weekly target
///   monthlyTarget: 1500,   // Example monthly target
///   yearlyTarget: 18000,   // Example yearly target
///   customeMeasurementUnitId: null,
/// );
/// ```
///
/// **Hydration Reminder**:
/// ```dart
/// GoalEntity(
///   id: 'water_goal_2',
///   userId: 'user_123',
///   description: 'Daily water intake target',
///   refType: ReferenceType.subTask,
///   refId: 'sub_hydration',
///   measurementUnit: MeasurementUnit.liter,
///   goalConstraint: GoalConstraint.min,
///   hourlyTarget: 0,       // Not applicable for hourly tracking
///   dailyTarget: 2.5,      // At least 2.5 liters daily
///   weeklyTarget: 17.5,    // Weekly target
///   monthlyTarget: 70,     // Example monthly target
///   yearlyTarget: 840,     // Example yearly target
///   customeMeasurementUnitId: null,
/// );
/// ```
class GoalEntity extends BaseOwnedEntity {
  //========================
  // Constructors
  //========================

  /// Base constructor for fully initialized goal entity.
  GoalEntity({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.refType,
    required this.refId,
    required this.measurementUnit,
    required this.goalConstraint,
    this.customMeasurementUnitId,
    super.description,
    super.updatedAt,
    this.goalTargets = const {},
  });

  /// Named constructor for creating a new goal.
  ///
  /// Automatically generates `id` and `createdAt` in the domain layer.
  GoalEntity.create({
    required super.userId,
    required this.refType,
    required this.refId,
    required this.measurementUnit,
    required this.goalConstraint,
    this.customMeasurementUnitId,
    super.description,
    this.goalTargets = const {},
  }) : super.create();

  /// Named constructor for updating an existing goal.
  ///
  /// Requires all fields explicitly, including `id` and `createdAt`.
  GoalEntity._update({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.refType,
    required this.refId,
    required this.measurementUnit,
    required this.goalConstraint,
    this.customMeasurementUnitId,
    super.description,
    this.goalTargets = const {},
  }) : super.update();

  //========================
  // Factories
  //========================

  /// Factory to create a goal entity from minimal input data.
  ///
  /// Simplifies initialization for UI or service layers.
  factory GoalEntity.createFromData({
    required String userId,
    required ReferenceType refType,
    required String refId,
    required MeasurementUnit measurementUnit,
    required GoalConstraint goalConstraint,
    String? customMeasurementUnitId,
    String? description,
    Map<RepetitionType, dynamic>? goalTargets,
  }) => GoalEntity.create(
    userId: userId,
    refType: refType,
    refId: refId,
    measurementUnit: measurementUnit,
    goalConstraint: goalConstraint,
    customMeasurementUnitId: customMeasurementUnitId,
    description: description,
    goalTargets: goalTargets ?? const {},
  );

  /// Factory to create an updated GoalEntity from input data.
  factory GoalEntity.update({
    required GoalEntity oldGoal,
    required MeasurementUnit measurementUnit,
    required GoalConstraint goalConstraint,
    String? customMeasurementUnitId,
    String? description,
    Map<RepetitionType, dynamic> goalTargets = const {},
  }) => GoalEntity._update(
    id: oldGoal.id,
    userId: oldGoal.userId,
    createdAt: oldGoal.createdAt,
    refType: oldGoal.refType,
    refId: oldGoal.refId,
    measurementUnit: measurementUnit,
    goalConstraint: goalConstraint,
    customMeasurementUnitId: customMeasurementUnitId,
    description: description,
    goalTargets: goalTargets,
  );

  /// Creates a complete goal configuration.
  ///
  /// [refType]: Whether this goal is for a main task or sub-task.
  /// [refId]: Associated task/sub-task identifier.
  /// [customMeasurementUnitId]: Base unit for progress tracking (e.g., liters, hours).
  /// [goalConstraint]: Success criteria (minimum/maximum thresholds).
  /// [hourlyTarget, dailyTarget, weeklyTarget, monthlyTarget, yearlyTarget]:
  /// required target amounts during active time periods.
  /// [measurementUnit]: Reference to user-defined units when needed.

  /// The type of associated work item (task/sub-task).
  final ReferenceType refType;

  /// Identifier of the linked task or sub-task.
  final String refId;

  /// Base unit for measuring progress.
  final MeasurementUnit measurementUnit;

  /// Defines whether the goal requires meeting a minimum
  /// or staying below a maximum value.
  final GoalConstraint goalConstraint;

  /// Specifies the required target amounts for each repetition period (e.g., minutely, hourly, daily).
  ///
  /// This map uses [RepetitionType] as keys and the corresponding target values as values.
  ///
  /// The interpretation of each value depends on [goalConstraint]:
  /// - **Range Constraint:** The value should be a `Range` object or a map like `{ "min": 0.5, "max": 1.0 }`, representing the allowed range for that period.
  ///   - Example: `{ RepetitionType.hourly: { "min": 0.5, "max": 1.0 } }` means the hourly target must be between 0.5 and 1.0 units.
  /// - **Minimum Constraint:** The value is the minimum required amount for the period.
  ///   - Example: `{ RepetitionType.daily: 2.5 }` means at least 2.5 units per day.
  /// - **Maximum Constraint:** The value is the maximum allowed amount for the period.
  ///   - Example: `{ RepetitionType.weekly: 10 }` means no more than 10 units per week.
  ///
  /// Multiple periods can be specified simultaneously:
  /// ```dart
  /// goalTargets: {
  ///   RepetitionType.hourly: 0.5, // At least 0.5 units per hour
  ///   RepetitionType.daily: { "min": 2, "max": 3 }, // Between 2 and 3 units per day
  ///   RepetitionType.weekly: 15, // At least 15 units per week
  /// }
  /// ```
  final Map<RepetitionType, dynamic> goalTargets;

  /// Reference to user-defined measurement units when applicable.
  /// - Used when [measurementUnit] is set to [MeasurementUnit.custom].
  final String? customMeasurementUnitId;

  GoalEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    ReferenceType? refType,
    String? refId,
    MeasurementUnit? measurementUnit,
    String? customMeasurementUnitId,
    GoalConstraint? goalConstraint,
    Map<RepetitionType, dynamic>? goalTargets,
  }) => GoalEntity(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    userId: userId ?? this.userId,
    description: description ?? this.description,
    refType: refType ?? this.refType,
    refId: refId ?? this.refId,
    measurementUnit: measurementUnit ?? this.measurementUnit,
    customMeasurementUnitId: customMeasurementUnitId ?? this.customMeasurementUnitId,
    goalConstraint: goalConstraint ?? this.goalConstraint,
    goalTargets: goalTargets ?? this.goalTargets,
  );

  @override
  List<Object?> get props => [
    ...super.props,
    refType,
    measurementUnit,
    customMeasurementUnitId,
    goalConstraint,
    refId,
    goalTargets,
  ];
}
