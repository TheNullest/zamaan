// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduleTypeAdapter extends TypeAdapter<ScheduleType> {
  @override
  final typeId = 120;

  @override
  ScheduleType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ScheduleType.fixedDate;
      case 1:
        return ScheduleType.recurringWeekDays;
      case 2:
        return ScheduleType.recurringMonthDays;
      case 3:
        return ScheduleType.recurringIntervals;
      default:
        return ScheduleType.fixedDate;
    }
  }

  @override
  void write(BinaryWriter writer, ScheduleType obj) {
    switch (obj) {
      case ScheduleType.fixedDate:
        writer.writeByte(0);
      case ScheduleType.recurringWeekDays:
        writer.writeByte(1);
      case ScheduleType.recurringMonthDays:
        writer.writeByte(2);
      case ScheduleType.recurringIntervals:
        writer.writeByte(3);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
