import 'package:zamaan/shared/domain/entities/base_owned_entity.dart';
import 'package:zamaan/shared/domain/enums/hive/week_day.dart';

/// Represents the scheduling definition for a task, including repetition patterns
/// and additional custom scheduling rules.
///
/// This entity defines all aspects of how a task is scheduled, such as whether it repeats weekly,
/// on specific days of the month, or according to custom-defined intervals. It incorporates both
/// standard scheduling logic (e.g., weekdays, time ranges) and advanced customization (e.g., specific
/// scheduled days or intervals).

class ScheduleConstraintsEntity extends BaseOwnedEntity {
  /// Constructs a [ScheduleConstraintsEntity] with the given parameters.
  ///
  /// - [taskId]: The ID of the main task associated with this schedule.
  /// - [startDate]: Defines the start and end dates for the schedule.
  //========================
  // Constructors
  //========================

  /// Base constructor for fully initialized schedule constraints entity.
  ScheduleConstraintsEntity({
    required super.id,
    required super.userId,
    required super.createdAt,
    required super.description,
    required this.taskId,
    required this.enforceScheduleBounds,
    required this.exceptionDates,
    required this.exceptionWeekDays,
    required this.exceptionMonthDays,
    this.startDate,
    this.endDate,
    super.updatedAt,
  });

  /// Named constructor for creating a new schedule constraints entity.
  ///
  /// Automatically generates `id` and `createdAt` in the domain layer.
  ScheduleConstraintsEntity.create({
    required super.userId,
    required this.taskId,
    required this.enforceScheduleBounds,
    required this.exceptionDates,
    required this.exceptionWeekDays,
    required this.exceptionMonthDays,
    super.description,
    this.startDate,
    this.endDate,
  }) : super.create();

  /// Named constructor for updating an existing schedule constraints entity.
  ///
  /// Requires all fields explicitly, including `id` and `createdAt`.
  /// Does not include `updatedAt` in the constructor.
  ScheduleConstraintsEntity.update({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.taskId,
    required this.enforceScheduleBounds,
    required this.exceptionDates,
    required this.exceptionWeekDays,
    required this.exceptionMonthDays,
    super.description,
    this.startDate,
    this.endDate,
  }) : super.update();

  //========================
  // Factories
  //========================

  /// Factory to create an updated ScheduleConstraintsEntity from input data.
  factory ScheduleConstraintsEntity.updateFromData({
    required ScheduleConstraintsEntity old,
    bool? enforceScheduleBounds,
    List<DateTime>? exceptionDates,
    List<WeekDay>? exceptionWeekDays,
    List<int>? exceptionMonthDays,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return ScheduleConstraintsEntity.update(
      id: old.id,
      userId: old.userId,
      createdAt: old.createdAt,
      taskId: old.taskId,
      enforceScheduleBounds: enforceScheduleBounds ?? old.enforceScheduleBounds,
      exceptionDates: exceptionDates ?? old.exceptionDates,
      exceptionWeekDays: exceptionWeekDays ?? old.exceptionWeekDays,
      exceptionMonthDays: exceptionMonthDays ?? old.exceptionMonthDays,
      description: description ?? old.description,
      startDate: startDate ?? old.startDate,
      endDate: endDate ?? old.endDate,
    );
  }

  /// The [taskId] of the main task associated with this schedule.
  final String taskId;

  /// The [startDate] during which the schedule is active.
  ///
  /// This object encapsulates both the start and end times for the schedule.
  final DateTime? startDate;

  final DateTime? endDate;

  final List<DateTime> exceptionDates;

  final List<WeekDay> exceptionWeekDays;
  final List<int> exceptionMonthDays;

  final bool enforceScheduleBounds;

  /// Returns a modified copy of this [ScheduleConstraintsEntity].
  ///
  /// Any provided parameters will override the current instance's values.
  ScheduleConstraintsEntity copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? description,
    String? taskId,
    DateTime? startDate,
    DateTime? endDate,
    List<DateTime>? exceptionDates,
    List<WeekDay>? exceptionWeekDays,
    List<int>? exceptionMonthDays,
    bool? enforceScheduleBounds,
  }) {
    return ScheduleConstraintsEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      description: description ?? this.description,
      taskId: taskId ?? this.taskId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      exceptionDates: exceptionDates ?? List.from(this.exceptionDates),
      exceptionWeekDays: exceptionWeekDays ?? List.from(this.exceptionWeekDays),
      exceptionMonthDays: exceptionMonthDays ?? List.from(this.exceptionMonthDays),
      enforceScheduleBounds: enforceScheduleBounds ?? this.enforceScheduleBounds,
    );
  }

  /// Equality comparison properties.
  ///
  /// Includes all properties that define the schedule for equality checks.
  @override
  List<Object?> get props => [
    ...super.props,
    taskId,
    startDate,
    enforceScheduleBounds,
    exceptionWeekDays,
    exceptionMonthDays,
    exceptionDates,
  ];
}
