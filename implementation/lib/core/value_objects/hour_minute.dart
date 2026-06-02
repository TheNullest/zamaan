// lib/core/value_objects/hour_minute.dart
class HourMinute {
  final int hour; // 0-23
  final int minute; // 0-59

  const HourMinute(this.hour, this.minute)
    : assert(hour >= 0 && hour <= 23),
      assert(minute >= 0 && minute <= 59);

  factory HourMinute.fromDateTime(DateTime dateTime) => HourMinute(dateTime.hour, dateTime.minute);

  int get minutesSinceMidnight => hour * 60 + minute;

  DateTime onDate(DateTime date) => DateTime(date.year, date.month, date.day, hour, minute);

  @override
  String toString() => '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourMinute &&
          runtimeType == other.runtimeType &&
          hour == other.hour &&
          minute == other.minute;

  @override
  int get hashCode => Object.hash(hour, minute);
}
