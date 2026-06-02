import 'package:zamaan/shared/domain/entities/base_owned_entity.dart';
import 'package:zamaan/shared/domain/enums/hive/priority.dart';
import 'package:zamaan/shared/domain/enums/hive/task_status.dart';

/// Represents a task with configurable properties and time tracking capabilities.
///
/// ## Example Usage
/// ```dart
/// final task = TaskEntity(
///   title: "Mobile App Redesign",
///   colorCode: 0xFF2196F3, // Material Blue
///   iconCode: 0xe3c9, // Material Icons "work" code
///   priority: Priority.high,
///   categoryIds: [CategoryEntity(id: "work", title: "Work Projects")],
///   fixedTagIds: [TagEntity(id: "urgent", title: "Urgent")],
///   totalSpentTime: Duration(hours: 12),
///   archived: false,
///   taskStatus: TaskStatus.inProgress,
///   id: "task_123",
///   userId: "user_456",
///   createdAt: DateTime(2023, 10, 1),
///   description: "Complete VM/UX overhaul",
/// );
/// ```
class TaskEntity extends BaseOwnedEntity {
  //========================
  // Constructors
  //========================

  /// Base constructor for fully initialized entity.
  TaskEntity({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.title,
    required this.colorCode,
    required this.iconCode,
    required this.priority,
    required this.categoryIds,
    required this.fixedTagIds,
    required this.totalSpentTime,
    required this.archived,
    required this.taskStatus,
    super.description,
    super.updatedAt,
  });

  /// Named constructor for creating a new entity.
  ///
  /// Automatically generates `id` and `createdAt` in the domain layer.
  TaskEntity.create({
    required super.userId,
    required this.title,
    required this.colorCode,
    required this.iconCode,
    required this.priority,
    required this.categoryIds,
    required this.fixedTagIds,
    required this.archived,
    required this.taskStatus,
    super.description,
    this.totalSpentTime = Duration.zero,
  }) : super.create();

  /// Named constructor for updating an existing entity.
  ///
  /// Requires all fields explicitly, including `id` and `createdAt`.
  /// Does not include `updatedAt`.
  TaskEntity.update({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.title,
    required this.colorCode,
    required this.iconCode,
    required this.priority,
    required this.categoryIds,
    required this.fixedTagIds,
    required this.totalSpentTime,
    required this.archived,
    required this.taskStatus,
    super.description,
  }) : super.update();

  //========================
  // Factories
  //========================
  factory TaskEntity.updateFromData({
    required TaskEntity old,
    String? title,
    int? colorCode,
    int? iconCode,
    Priority? priority,
    List<String>? categoryIds,
    List<String>? fixedTagIds,
    Duration? totalSpentTime,
    bool? archived,
    TaskStatus? taskStatus,
    String? description,
  }) {
    return TaskEntity.update(
      id: old.id,
      userId: old.userId,
      createdAt: old.createdAt,
      title: title ?? old.title,
      colorCode: colorCode ?? old.colorCode,
      iconCode: iconCode ?? old.iconCode,
      priority: priority ?? old.priority,
      categoryIds: categoryIds ?? old.categoryIds,
      fixedTagIds: fixedTagIds ?? old.fixedTagIds,
      totalSpentTime: totalSpentTime ?? old.totalSpentTime,
      archived: archived ?? old.archived,
      taskStatus: taskStatus ?? old.taskStatus,
      description: description ?? old.description,
    );
  }

  /// Short descriptive title (max 100 chars)
  final String title;

  /// ARGB color value (0xAARRGGBB format)
  final int colorCode;

  /// Material Design icon code point
  final int iconCode;

  /// Importance level for task prioritization
  final Priority priority;

  /// Primary categorization groups
  final List<String> categoryIds;

  /// Permanent tags that cannot be auto-removed
  final List<String> fixedTagIds;

  /// Cumulative time spent across all activities
  final Duration totalSpentTime;

  /// Whether the task is hidden from main views
  final bool archived;

  /// Current lifecycle state
  final TaskStatus taskStatus;

  // ========================
  // Validation Methods
  // ========================

  /// Validates task title format
  bool get isTitleValid => title.trim().isNotEmpty && title.length <= 100;

  /// Validates color code format
  bool get isColorValid => colorCode >= 0x00000000 && colorCode <= 0xFFFFFFFF;

  /// Validates icon code format
  bool get isIconValid => iconCode >= 0 && iconCode <= 0xFFFF; // Unicode BMP range

  /// Validates all task properties
  bool get isValid => isTitleValid && isColorValid && isIconValid;

  // ========================
  // Derived Properties
  // ========================

  /// Progress percentage (0-100) based on spent time vs estimate
  double get progressPercentage {
    // Implement your estimation logic here
    final estimatedTotal = const Duration(hours: 20).inMilliseconds;
    return (totalSpentTime.inMilliseconds / estimatedTotal * 100).clamp(0, 100);
  }

  /// Formatted time spent (e.g., "12h 30m")
  String get formattedSpentTime {
    final hours = totalSpentTime.inHours;
    final minutes = totalSpentTime.inMinutes % 60;
    return '${hours}h ${minutes}m';
  }

  // ========================
  // Status Checks
  // ========================

  bool get isActive =>
      !archived &&
      taskStatus != TaskStatus.done &&
      taskStatus != TaskStatus.doneLate &&
      taskStatus != TaskStatus.failed &&
      taskStatus != TaskStatus.cancelled;

  bool get isOverdue => taskStatus == TaskStatus.overdue;

  bool get requiresAttention => isActive && (isOverdue || priority == Priority.high);

  TaskEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? description,
    String? title,
    int? colorCode,
    int? iconCode,
    List<String>? categoryIds,
    Priority? priority,
    bool? archived,
    List<String>? fixedTagIds,
    Duration? totalSpentTime,
    TaskStatus? occurrenceStatus,
  }) => TaskEntity(
    id: id ?? this.id,
    updatedAt: updatedAt ?? this.updatedAt,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    userId: userId ?? this.userId,
    title: title ?? this.title,
    colorCode: colorCode ?? this.colorCode,
    iconCode: iconCode ?? this.iconCode,
    categoryIds: categoryIds ?? List.from(this.categoryIds),
    priority: priority ?? this.priority,
    archived: archived ?? this.archived,
    fixedTagIds: fixedTagIds ?? List.from(this.fixedTagIds),
    totalSpentTime: totalSpentTime ?? this.totalSpentTime,
    taskStatus: occurrenceStatus ?? taskStatus,
  );

  @override
  List<Object?> get props => [
    ...super.props,
    title,
    categoryIds,
    createdAt,
    colorCode,
    iconCode,
    priority,
    archived,
    fixedTagIds,
    totalSpentTime,
    taskStatus,
  ];
}
