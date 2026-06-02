import 'package:zamaan/shared/domain/entities/base_owned_entity.dart';
import 'package:zamaan/shared/domain/enums/hive/priority.dart';
import 'package:zamaan/shared/domain/enums/hive/task_status.dart';

/// Represents a subtask associated with a parent task, including its metadata and progress.
///
/// ## Example Usage
/// ```dart
/// SubTaskEntity(
///   taskId: "task_123", // Parent task ID
///   title: "Design VM mockups",
///   priority: Priority.medium,
///   status: TaskStatus.inProgress,
///   totalSpentTime: Duration(hours: 2),
///   // Inherited fields from BaseEntityAbstraction:
///   id: "subtask_456",
///   userId: "user_789",
///   createdAt: DateTime(2023, 10, 15),
///   description: "Initial design phase",
/// )
/// ```
///
/// ## Behavior
/// - Subtasks inherit properties like `userId` and `createdAt` from their parent task.
/// - The `totalSpentTime` is automatically aggregated from linked [TaskActivityEntity] instances.
class SubTaskEntity extends BaseOwnedEntity {
  //========================
  // Constructors
  //========================

  /// Base constructor for fully initialized entity.
  SubTaskEntity({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.taskId,
    required this.priority,
    required this.title,
    required this.status,
    required this.totalSpentTime,
    super.description,
    super.updatedAt,
  });

  /// Named constructor for creating a new subtask.
  ///
  /// Automatically generates `id` and `createdAt` in the domain layer.
  SubTaskEntity.create({
    required super.userId,
    required this.taskId,
    required this.priority,
    required this.title,
    required this.status,
    required this.totalSpentTime,
    super.description,
  }) : super.create();

  /// Named constructor for updating an existing subtask.
  ///
  /// Requires all fields explicitly, including `id` and `createdAt`.
  /// Does not include `updatedAt`.
  SubTaskEntity.update({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.taskId,
    required this.priority,
    required this.title,
    required this.status,
    required this.totalSpentTime,
    super.description,
  }) : super.update();

  //========================
  // Factories
  //========================

  /// Factory to create a subtask entity from input data.
  ///
  /// Simplifies initialization for UI or service layers.
  factory SubTaskEntity.createFromData({
    required String userId,
    required String taskId,
    required Priority priority,
    required String title,
    required TaskStatus status,
    required Duration totalSpentTime,
    String? description,
  }) => SubTaskEntity.create(
    userId: userId,
    taskId: taskId,
    priority: priority,
    title: title,
    status: status,
    totalSpentTime: totalSpentTime,
    description: description,
  );

  /// Factory to create an updated subtask entity from input data.
  ///
  /// Simplifies updating for UI or service layers.
  factory SubTaskEntity.updateFromData({
    required SubTaskEntity old,
    required Priority priority,
    required String title,
    required TaskStatus status,
    String? description,
  }) => SubTaskEntity.update(
    id: old.id,
    userId: old.userId,
    createdAt: old.createdAt,
    taskId: old.taskId,
    totalSpentTime: old.totalSpentTime,
    priority: priority,
    title: title,
    status: status,
    description: description,
  );

  /// The ID of the parent task this subtask belongs to.
  ///
  /// This field acts as a foreign key linking to a [TaskEntity].
  final String taskId;

  /// The priority level of the subtask.
  ///
  /// Possible values:
  /// - [Priority.low] ("کم")
  /// - [Priority.medium] ("متوسط")
  /// - [Priority.high] ("زیاد")
  final Priority priority;

  /// A short, descriptive title for the subtask.
  ///
  /// Example: "Refactor authentication module"
  final String title;

  /// The current status of the subtask.
  ///
  /// Possible values include:
  /// - [TaskStatus.inProgress] ("در حال انجام")
  /// - [TaskStatus.Done] ("انجام شده")
  /// - [TaskStatus.doneLate] ("تکمیل خارج از برنامه")
  final TaskStatus status;

  /// The total time spent on this subtask, aggregated from all [TaskActivityEntity] records.
  ///
  /// - This value is **automatically calculated** and should not be set manually.
  /// - Will be `null` if no time has been logged yet.
  final Duration? totalSpentTime;

  SubTaskEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    Duration? totalSpentTime,
    String? userId,
    String? description,
    String? taskId,
    String? title,
    Priority? priority,
    TaskStatus? status,
  }) => SubTaskEntity(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    userId: userId ?? this.userId,
    taskId: taskId ?? this.taskId,
    title: title ?? this.title,
    priority: priority ?? this.priority,
    status: status ?? this.status,
    totalSpentTime: totalSpentTime ?? this.totalSpentTime,
  );

  @override
  List<Object?> get props => [...super.props, taskId, title, priority, status, totalSpentTime];
}
