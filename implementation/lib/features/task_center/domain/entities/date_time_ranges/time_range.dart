import 'package:zamaan/core/extensions/int.dart';
import 'package:zamaan/core/utils/uuid.dart';
import 'package:zamaan/shared/domain/entities/base_owned_entity.dart';

/// A [TimeRangeEntity] represents a specific time interval within a day,
/// defined by a start and an end [Duration]. It is associated with a parent
/// entity via the [parentId] field.
///
/// The [start] must always be earlier than the [end]. If no [start] is specified,
/// it defaults to `Duration.zero` (i.e. midnight). If no [end] is provided,
/// it defaults to a value corresponding to 23:59:59.999999.
///
/// This entity extends [BaseEntity], inheriting common properties
/// such as [id], [userId], [createdAt], and [description].
class TimeRangeEntity extends BaseOwnedEntity {
  static const int minutesPerDay = 1440;

  /// Constructs a [TimeRangeEntity].
  ///
  /// The required parameters are:
  /// - [id]: A unique identifier for this time range.
  /// - [userId]: The identifier of the user associated with this entity.
  /// - [createdAt]: The creation timestamp.
  /// - [parentId]: The identifier of the parent entity. 'ScheduleConstraintsEntity's Id'
  ///
  /// Optional parameters:
  /// - [description] and [updatedAt] (inherited from [BaseEntity]).
  /// - [start]: The starting time as a [Duration]. Defaults to [Duration.zero] if omitted.
  /// - [end]: The ending time as a [Duration]. Defaults to 23:59:59.999999 if omitted.
  ///
  /// Throws an [ArgumentError] if the resulting [start] is not before [end].
  // ------------------------------------------------------------
  // BASE CONSTRUCTOR (used for rehydration from persistence)
  // ------------------------------------------------------------
  TimeRangeEntity({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.parentId,
    required this.start,
    required this.end,
    super.description,
    super.updatedAt,
    super.order,
  }) : assert(start >= 0 && start <= minutesPerDay, 'Start out of range'),
       assert(end >= 0 && end <= minutesPerDay, 'End out of range'),
       assert(start <= end, 'Start must be <= end');

  // ------------------------------------------------------------
  // CREATE CONSTRUCTOR (internal, assigns id & createdAt via BaseEntity.create)
  // ------------------------------------------------------------
  TimeRangeEntity.create({
    required super.userId,
    required this.parentId,
    required this.start,
    required this.end,
    super.description,
    super.order,
  }) : super.create();

  // ------------------------------------------------------------
  // UPDATE CONSTRUCTOR (internal, assigns updatedAt via BaseEntity.update)
  // ------------------------------------------------------------
  TimeRangeEntity.update({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.parentId,
    required this.start,
    required this.end,
    super.description,
    super.order,
  }) : super.update();

  // ------------------------------------------------------------
  // FACTORIES — CREATION
  // ------------------------------------------------------------

  /// Create a full-day range (optional convenience)
  factory TimeRangeEntity.fullDay({
    required String userId,
    required String parentId,
    String? description,
    int? order,
  }) {
    return TimeRangeEntity.create(
      userId: userId,
      parentId: parentId,
      start: 0,
      end: 1440,
      description: description,
      order: order,
    );
  }

  // ------------------------------------------------------------
  // FACTORIES — UPDATE
  // ------------------------------------------------------------

  /// Update by replacing specific fields (classic partial update)
  factory TimeRangeEntity.updateFromData({
    required TimeRangeEntity old,
    int? start,
    int? end,
    String? description,
    int? order,
  }) {
    return TimeRangeEntity.update(
      id: old.id,
      userId: old.userId,
      createdAt: old.createdAt,
      parentId: old.parentId,
      start: start ?? old.start,
      end: end ?? old.end,
      description: description ?? old.description,
      order: order ?? old.order,
    );
  }

  factory TimeRangeEntity.setNewTimeRange({
    required int start,
    required int end,
    required String userId,
    required String parentId,
  }) {
    return TimeRangeEntity(
      id: uuidGenerator,
      userId: userId,
      createdAt: DateTime.now(),
      parentId: parentId,
      start: start,
      end: end,
    );
  }

  /// The starting time of this range.
  final int start;

  /// The ending time of this range.
  final int end;

  /// The identifier of the parent to which this time range belongs.
  final String parentId;

  /// Duration of this time range.
  Duration get duration => Duration(minutes: end - start);

  /// Converts the [start] [Duration] to a [DateTime] on the specified [date].
  ///
  /// This method leverages the extension method `toDateTimeForDate` defined on
  /// [Duration], which creates a [DateTime] combining the date components from
  /// [date] and the time components from [start].
  DateTime startAsDateTime(DateTime date) => start.toDateTimeForDate(date);

  /// Converts the [end] [Duration] to a [DateTime] on the specified [date].
  ///
  /// This method leverages the extension method `toDateTimeForDate` defined on
  /// [Duration], which creates a [DateTime] combining the date components from
  /// [date] and the time components from [end].
  DateTime endAsDateTime(DateTime date) => end.toDateTimeForDate(date);

  /// Returns true if the given [minuteOfDay] (0‑1440) is inside this range.
  bool contains(int minuteOfDay) => minuteOfDay >= start && minuteOfDay <= end;

  TimeRangeEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? parentId,
    int? start,
    int? end,
    String? description,
    int? order,
  }) {
    return TimeRangeEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
      parentId: parentId ?? this.parentId,
      start: start ?? this.start,
      end: end ?? this.end,
      description: description ?? this.description,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [...super.props, parentId, start, end];
}
