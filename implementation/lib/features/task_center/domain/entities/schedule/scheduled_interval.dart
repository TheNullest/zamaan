import 'package:zamaan/shared/domain/entities/base_owned_entity.dart';
import 'package:zamaan/shared/domain/enums/hive/interval_unit.dart';

/// Represents an interval-based scheduling configuration.
///
/// This entity defines how often a task repeats within specified intervals
/// (e.g., every 3 days or every 2 hours) and includes details about the scheduled
/// times, repetition count, and configuration of consecutive occurrences.
///
/// **Example Usage:**
/// ```dart
/// final scheduledInterval = ScheduledIntervalEntity(
///   id: 'interval_001',
///   userId: 'user_001',
///   createdAt: DateTime.now(),
///   updatedAt: DateTime.now(),
///   description: 'Do the task every 3 days based on scheduled times',
///   taskId: 'schedule_001',
///   intervalUnit: IntervalUnit.days,
///   intervalValue: 3,
///   scheduledTimeIds: [
///     'timeRange_1',
///     'timeRange_2',
///   ],
///   repeatCount: 5,
///   enforceScheduleBounds: true,
///   startDate: DateTime(2025, 5, 1),
///   consecutiveOccurrences: 1,
/// );
/// ```
class ScheduledIntervalEntity extends BaseOwnedEntity {
  //========================
  // Constructors
  //========================

  /// Base constructor for fully initialized entity.
  ScheduledIntervalEntity({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.taskId,
    required this.intervalUnit,
    required this.intervalValue,
    required this.repeatCount,
    required this.scheduledTimeIds,
    required this.startDate,
    this.consecutiveOccurrences = 1,
    super.description,
    super.updatedAt,
  });

  /// Named constructor for creating a new entity.
  ///
  /// Automatically generates `id` and `createdAt` in the domain layer.
  ScheduledIntervalEntity.create({
    required super.userId,
    required this.taskId,
    required this.intervalUnit,
    required this.intervalValue,
    required this.repeatCount,
    required this.scheduledTimeIds,
    required this.startDate,
    this.consecutiveOccurrences = 1,
    super.description,
  }) : super.create();

  /// Named constructor for updating an existing entity.
  ///
  /// Requires all fields explicitly, including `id` and `createdAt`.
  /// Does not include `updatedAt`.
  ScheduledIntervalEntity.update({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.taskId,
    required this.intervalUnit,
    required this.intervalValue,
    required this.repeatCount,
    required this.scheduledTimeIds,
    required this.startDate,
    this.consecutiveOccurrences = 1,
    super.description,
  }) : super.update();

  //========================
  // Factories
  //========================

  /// Factory to create the entity from input data.
  ///
  /// Simplifies initialization for UI or service layers.
  factory ScheduledIntervalEntity.createFromData({
    required String userId,
    required String taskId,
    required IntervalUnit intervalUnit,
    required double intervalValue,
    required int repeatCount,
    required List<String> scheduledTimeIds,
    required DateTime startDate,
    int consecutiveOccurrences = 1,
    String? description,
  }) => ScheduledIntervalEntity.create(
    userId: userId,
    taskId: taskId,
    intervalUnit: intervalUnit,
    intervalValue: intervalValue,
    repeatCount: repeatCount,
    scheduledTimeIds: scheduledTimeIds,
    startDate: startDate,
    consecutiveOccurrences: consecutiveOccurrences,
    description: description,
  );

  /// Factory to create an updated ScheduledIntervalEntity from input data.
  factory ScheduledIntervalEntity.updateFromData({
    required String id,
    required String userId,
    required DateTime createdAt,
    required String taskId,
    required IntervalUnit intervalUnit,
    required double intervalValue,
    required int repeatCount,
    required List<String> scheduledTimeIds,
    required DateTime startDate,
    int consecutiveOccurrences = 1,
    String? description,
  }) => ScheduledIntervalEntity.update(
    id: id,
    userId: userId,
    createdAt: createdAt,
    taskId: taskId,
    intervalUnit: intervalUnit,
    intervalValue: intervalValue,
    repeatCount: repeatCount,
    scheduledTimeIds: scheduledTimeIds,
    startDate: startDate,
    consecutiveOccurrences: consecutiveOccurrences,
    description: description,
  );

  /// The ID of the schedule constraint to which this interval configuration belongs.
  final String taskId;

  /// The unit of time defining the interval (e.g., minute, hour, day, week, month, or year).
  final IntervalUnit intervalUnit;

  /// The magnitude of the interval.
  /// For instance, an intervalValue of 3 with an intervalUnit of days indicates "every 3 days."
  final double intervalValue;

  /// Specifies how many times the interval is intended to repeat.
  /// A null value may indicate an indefinite repetition or be handled by your business logic.
  final int? repeatCount;

  /// The identifiers for the scheduled time ranges within an interval.
  /// Each identifier corresponds to a specific [TimeRangeEntity] where the task should occur.
  final List<String> scheduledTimeIds;

  /// The starting date for this scheduling configuration.
  final DateTime startDate;

  /// The number of consecutive occurrences to generate for each computed base date.
  /// For example, a value of 1 means a single occurrence per interval, while a higher value produces multiple consecutive dates.
  final int consecutiveOccurrences;

  /// Creates a modified copy of this [ScheduledIntervalEntity].
  ///
  /// Any provided parameters will replace the corresponding property, while properties not
  /// provided will retain their existing values.
  ScheduledIntervalEntity copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    String? description,
    DateTime? updatedAt,
    DateTime? startDate,
    String? taskId,
    IntervalUnit? intervalUnit,
    double? intervalValue,
    int? consecutiveOccurrences,
    int? repeatCount,
    List<String>? scheduledTimeIds,
  }) {
    return ScheduledIntervalEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      updatedAt: updatedAt ?? this.updatedAt,
      taskId: taskId ?? this.taskId,
      intervalUnit: intervalUnit ?? this.intervalUnit,
      intervalValue: intervalValue ?? this.intervalValue,
      consecutiveOccurrences: consecutiveOccurrences ?? this.consecutiveOccurrences,
      repeatCount: repeatCount ?? this.repeatCount,
      startDate: startDate ?? this.startDate,
      scheduledTimeIds:
          scheduledTimeIds ?? List.from(this.scheduledTimeIds), // Creates a new list instance.
    );
  }

  @override
  List<Object?> get props => [
    ...super.props,
    taskId,
    intervalUnit,
    intervalValue,
    repeatCount,
    scheduledTimeIds,
    startDate,
    consecutiveOccurrences,
  ];
}
