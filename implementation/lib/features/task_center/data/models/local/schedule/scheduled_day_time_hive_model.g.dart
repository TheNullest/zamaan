// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_day_time_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduledDayTimeHiveModelAdapter
    extends TypeAdapter<ScheduledDayTimeHiveModel> {
  @override
  final typeId = 18;

  @override
  ScheduledDayTimeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduledDayTimeHiveModel(
      id: fields[0] as String,
      createdAt: fields[2] as DateTime,
      ownerId: fields[1] as String,
      taskId: fields[10] as String,
      dayType: fields[11] as DayType,
      dayLabel: fields[12] as String,
      timeMode: fields[13] as ScheduledTimeMode,
      repeatCount: (fields[14] as num).toInt(),
      startTime: (fields[15] as num).toInt(),
      endTime: (fields[16] as num).toInt(),
      updatedAt: fields[4] as DateTime?,
      description: fields[3] as String?,
      order: (fields[5] as num?)?.toInt(),
      sharedWithUserIds: fields[8] == null
          ? const []
          : (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ScheduledDayTimeHiveModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ownerId)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.order)
      ..writeByte(8)
      ..write(obj.sharedWithUserIds)
      ..writeByte(10)
      ..write(obj.taskId)
      ..writeByte(11)
      ..write(obj.dayType)
      ..writeByte(12)
      ..write(obj.dayLabel)
      ..writeByte(13)
      ..write(obj.timeMode)
      ..writeByte(14)
      ..write(obj.repeatCount)
      ..writeByte(15)
      ..write(obj.startTime)
      ..writeByte(16)
      ..write(obj.endTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduledDayTimeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
