import 'package:zamaan/shared/domain/entities/base_owned_entity.dart';
import 'package:zamaan/shared/domain/enums/enums.dart';

/// **Represents a concrete work session (activity log) for a task or subtask.**
///
/// This entity captures the **actual time spent** on a task or subtask,
/// whether it was started manually or triggered by a scheduling system.
///
/// ### Purpose
/// * Record **when work actually started and ended** on a specific task/subtask.
/// * Track **status** (e.g., completed, Done late, cancelled).
/// * Optionally link this activity back to a **scheduled schedule** (via
///   [schedulerId] and [schedulerType]) if it was generated from a scheduled occurrence.
/// * Allow context-specific **variable tags** (for example, mood, urgency, or
///   ad-hoc labels) that may differ from the parent task's own tags.
///
/// ### Relation to Scheduled Instances
/// * A `ScheduledOccurrenceEntity` defines **when work is supposed to happen**
///   (the scheduled schedule).
/// * A `TaskActivityEntity` records **what actually happened** — the real
///   work session that took place.
///   Multiple `TaskActivityEntity` records can correspond to a single
///   scheduled occurrence (for example, if a user starts and stops work several
///   times during the scheduled window).
///
/// ### Typical Usage
/// ```dart
/// final activity = TaskActivityEntity(
///   referenceId: "task_123",
///   referenceType: ReferenceType.task,
///   startedAt: DateTime(2023, 10, 15, 14, 0),
///   endedAt: DateTime(2023, 10, 15, 16, 30),
///   variableTagIds: ["urgent"],
///   schedulerId: "sched_789", // optional link to a scheduled occurrence
///   schedulerType: SchedulerType.scheduledDayTime,
///   taskStatus: TaskStatus.completed,
///   id: "activity_456",
///   userId: "user_001",
///   createdAt: DateTime.now(),
///   description: "Client project work session",
/// );
///
/// // Example: compute duration worked
/// final duration = activity.endedAt!.difference(activity.startedAt);
/// print(duration); // 2h 30m
/// ```
///
/// ### Notes
/// * If [schedulerId] is `null`, this activity was **manually started**
///   and is not tied to any pre-defined schedule.
/// * Use [variableTagIds] to tag the specific session with
///   ad-hoc categories (for example “Deep Work” or “Quick Fix”)
///   independent of the task’s permanent tags.
class TaskActivityEntity extends BaseOwnedEntity {
  //========================
  // Constructors
  //========================

  /// Base constructor for fully initialized entity.
  TaskActivityEntity({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.referenceId,
    required this.referenceType,
    required this.variableTagIds,
    required this.taskStatus,
    required this.startedAt,
    this.endedAt,
    this.schedulerId,
    this.schedulerType,
    super.description,
    super.updatedAt,
  });

  /// Named constructor for creating a new entity.
  ///
  /// Automatically generates `id` and `createdAt` in the domain layer.
  TaskActivityEntity.create({
    required super.userId,
    required this.referenceId,
    required this.referenceType,
    required this.variableTagIds,
    required this.taskStatus,
    required this.startedAt,
    this.endedAt,
    this.schedulerId,
    this.schedulerType,
    super.description,
  }) : super.create();

  /// Named constructor for updating an existing entity.
  ///
  /// Requires all fields explicitly, including `id` and `createdAt`.
  /// Does not include `updatedAt`.
  TaskActivityEntity.update({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.referenceId,
    required this.referenceType,
    required this.variableTagIds,
    required this.taskStatus,
    required this.startedAt,
    this.endedAt,
    this.schedulerId,
    this.schedulerType,
    super.description,
  }) : super.update();

  //========================
  // Factories
  //========================

  /// Factory to create a new TaskActivityEntity from input data.
  factory TaskActivityEntity.createFromData({
    required String userId,
    required String referenceId,
    required ReferenceType referenceType,
    required List<String> variableTagIds,
    required TaskStatus taskStatus,
    required DateTime startedAt,
    DateTime? endedAt,
    String? schedulerId,
    ScheduleType? schedulerType,
    String? description,
  }) => TaskActivityEntity.create(
    userId: userId,
    referenceId: referenceId,
    referenceType: referenceType,
    variableTagIds: variableTagIds,
    taskStatus: taskStatus,
    startedAt: startedAt,
    endedAt: endedAt,
    schedulerId: schedulerId,
    schedulerType: schedulerType,
    description: description,
  );

  /// Factory to create an updated TaskActivityEntity from input data.
  factory TaskActivityEntity.updateFromData({
    required String id,
    required String userId,
    required DateTime createdAt,
    required String referenceId,
    required ReferenceType referenceType,
    required List<String> variableTagIds,
    required TaskStatus taskStatus,
    required DateTime startedAt,
    DateTime? endedAt,
    String? schedulerId,
    ScheduleType? schedulerType,
    String? description,
  }) => TaskActivityEntity.update(
    id: id,
    userId: userId,
    createdAt: createdAt,
    referenceId: referenceId,
    referenceType: referenceType,
    variableTagIds: variableTagIds,
    taskStatus: taskStatus,
    startedAt: startedAt,
    endedAt: endedAt,
    schedulerId: schedulerId,
    schedulerType: schedulerType,
    description: description,
  );

  /// The ID of the associated task or subtask.
  ///
  /// - When [referenceType] is `task`: links to [TaskEntity.id].
  /// - When [referenceType] is `subtask`: links to [SubTaskEntity.id].
  final String referenceId;

  /// Indicates whether this activity references a **task** or a **subtask**.
  final ReferenceType referenceType;

  /// Timestamp when this work session actually began.
  ///
  /// Used for duration calculations and progress tracking.
  final DateTime startedAt;

  /// Timestamp when this work session ended.
  ///
  /// `null` if the session is still in progress.
  final DateTime? endedAt;

  /// Ad-hoc or context-specific tags for this specific activity instance.
  ///
  /// These can differ from the parent task’s own tags.
  final List<String> variableTagIds;

  /// Optional reference to the scheduler definition that triggered this activity.
  ///
  /// `null` if this session was manually created or started outside of any
  /// predefined schedule.
  final String? schedulerId;

  /// Type of scheduling strategy that originated this activity,
  /// if it was created from a scheduled schedule.
  final ScheduleType? schedulerType;

  /// The current state of this activity session.
  ///
  /// For example:
  /// - [TaskStatus.Done] when finished successfully.
  /// - [TaskStatus.doneLate] if finished outside the scheduled window.
  final TaskStatus taskStatus;

  TaskActivityEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? startedAt,
    DateTime? endedAt,
    String? userId,
    String? description,
    String? referenceId,
    ReferenceType? referenceType,
    ScheduleType? schedulerType,
    String? schedulerId,
    List<String>? variableTagIds,
    TaskStatus? occurrenceStatus,
  }) => TaskActivityEntity(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    userId: userId ?? this.userId,
    referenceId: referenceId ?? this.referenceId,
    referenceType: referenceType ?? this.referenceType,
    startedAt: startedAt ?? this.startedAt,
    endedAt: endedAt ?? this.endedAt,
    variableTagIds: variableTagIds ?? this.variableTagIds,
    taskStatus: occurrenceStatus ?? taskStatus,
    schedulerId: schedulerId ?? this.schedulerId,
    schedulerType: schedulerType ?? this.schedulerType,
  );

  /// Properties used by `equatable` to compare instances.
  @override
  List<Object?> get props => [
    ...super.props,
    referenceId,
    referenceType,
    startedAt,
    endedAt,
    taskStatus,
    schedulerId,
    variableTagIds,
  ];
}
