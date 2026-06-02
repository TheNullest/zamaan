import 'package:zamaan/core/utils/date_time.dart';
import 'package:zamaan/core/utils/uuid.dart' as uuid;
import 'package:zamaan/core/value_objects/hour_minute.dart';
import 'package:zamaan/features/task_center/domain/entities/date_time_ranges/time_range.dart';
import 'package:zamaan/shared/domain/entities/base_owned_entity.dart';

/// Represents a date range with start & end dates.
/// Serialized with Hive to store it inside Hive-based entities.
class DateRangeEntity extends BaseOwnedEntity {
  // Base constructor (used for reconstructing from DB if needed)
  DateRangeEntity({
    required super.id,
    required super.userId,
    required super.createdAt,
    required this.parentId,
    required this.startDate,
    required this.endDate,
    super.description,
    super.updatedAt,
    super.order,
  });

  // CREATE
  DateRangeEntity.create({
    required super.userId,
    required super.description,
    required super.order,
    required this.parentId,
    required this.startDate,
    required this.endDate,
  }) : super.create();

  // UPDATE
  DateRangeEntity.update({
    required super.id,
    required super.userId,
    required super.description,
    required super.order,
    required super.createdAt,
    required this.parentId,
    required this.startDate,
    required this.endDate,
  }) : super.update();

  // --------------------------------------------
  // FACTORIES – CREATION
  // --------------------------------------------

  factory DateRangeEntity.createFromDates({
    required DateTime start,
    required DateTime end,
    required String userId,
    required String parentId,
    String? description,
    int? order,
  }) {
    return DateRangeEntity.create(
      startDate: start,
      endDate: end,
      parentId: parentId,
      userId: userId,
      description: description,
      order: order,
    );
  }

  factory DateRangeEntity.createFromTimeRange(TimeRangeEntity time, DateTime date) {
    return DateRangeEntity.create(
      startDate: time.startAsDateTime(date),
      endDate: time.endAsDateTime(date),
      parentId: time.parentId,
      userId: time.userId,
      description: time.description,
      order: time.order,
    );
  }

  // --------------------------------------------
  // FACTORIES – UPDATE
  // --------------------------------------------

  factory DateRangeEntity.updateFromData({
    required DateRangeEntity old,
    required DateTime start,
    required DateTime end,
    String? parentId,
    String? description,
    int? order,
  }) {
    return DateRangeEntity.update(
      id: old.id,
      userId: old.userId,
      createdAt: old.createdAt,
      parentId: parentId ?? old.parentId,
      startDate: start,
      endDate: end,
      description: description ?? old.description,
      order: order ?? old.order,
    );
  }

  factory DateRangeEntity.updateFromTimeRange({
    required DateRangeEntity old,
    required TimeRangeEntity time,
    required DateTime date,
  }) {
    return DateRangeEntity.update(
      id: old.id,
      userId: old.userId,
      createdAt: old.createdAt,
      parentId: time.parentId,
      startDate: time.startAsDateTime(date),
      endDate: time.endAsDateTime(date),
      description: time.description,
      order: time.order,
    );
  }

  /// The start date/time of the range.
  /// If null, the range is considered open-ended at the beginning.
  /// Always store the date in UTC for consistency.
  final DateTime? startDate;

  /// The end date/time of the range.
  /// If null, this implies that the range may be ongoing or unbounded.
  /// Always store the date in UTC for consistency.
  final DateTime? endDate;

  final String parentId;

  /// Returns duration between start and end times.
  /// If `end` is `null`, calculates duration until **now (`DateTime.now()`)**.
  Duration get duration => (endDate ?? DateTime.now()).difference(startDate!);

  /// Extracts the **time** (hour & minute) portion from `start` as `HourMinute`.
  HourMinute get startTime => HourMinute.fromDateTime(startDate!);

  /// Extracts the **time** (hour & minute) portion from `end` as `HourMinute`, if `end` exists.
  HourMinute? get endTime => endDate != null ? HourMinute.fromDateTime(endDate!) : null;

  /// Validates all range properties
  bool get isValid =>
      uuid.isValidUUID(id) &&
      (endDate == null || startDate!.isBefore(endDate!) || startDate!.isAtSameMomentAs(endDate!));

  /// Returns true if this range contains [date]
  bool overlapsWith(DateTime date) =>
      isWithinDates(currentDate: date, fromDate: startDate, toDate: endDate);

  /// Returns a copy of this entity with updated fields.
  /// Automatically sets `updatedAt` to the current time.
  DateRangeEntity copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    String? parentId,
    DateTime? startDate,
    DateTime? endDate,
    String? description,
    int? order,
  }) {
    return DateRangeEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? DateTime.now(),
      parentId: parentId ?? this.parentId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      order: order ?? this.order,
    );
  }

  @override
  List<Object?> get props => [...super.props, parentId, startDate, endDate];
}
