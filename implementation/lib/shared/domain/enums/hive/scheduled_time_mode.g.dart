// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_time_mode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduledTimeModeAdapter extends TypeAdapter<ScheduledTimeMode> {
  @override
  final typeId = 125;

  @override
  ScheduledTimeMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ScheduledTimeMode.fixed;
      case 1:
        return ScheduledTimeMode.flexible;
      case 2:
        return ScheduledTimeMode.windowed;
      default:
        return ScheduledTimeMode.fixed;
    }
  }

  @override
  void write(BinaryWriter writer, ScheduledTimeMode obj) {
    switch (obj) {
      case ScheduledTimeMode.fixed:
        writer.writeByte(0);
      case ScheduledTimeMode.flexible:
        writer.writeByte(1);
      case ScheduledTimeMode.windowed:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduledTimeModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
