// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduled_interval_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduledIntervalHiveModelAdapter
    extends TypeAdapter<ScheduledIntervalHiveModel> {
  @override
  final typeId = 19;

  @override
  ScheduledIntervalHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduledIntervalHiveModel(
      id: fields[0] as String,
      createdAt: fields[2] as DateTime,
      ownerId: fields[1] as String,
      taskId: fields[10] as String,
      intervalUnit: fields[11] as IntervalUnit,
      intervalValue: (fields[12] as num).toDouble(),
      repeatCount: (fields[13] as num?)?.toInt(),
      scheduledTimeIds: (fields[14] as List).cast<String>(),
      startDate: fields[15] as DateTime,
      consecutiveOccurrences: (fields[16] as num).toInt(),
      updatedAt: fields[4] as DateTime?,
      description: fields[3] as String?,
      order: (fields[5] as num?)?.toInt(),
      sharedWithUserIds: fields[8] == null
          ? const []
          : (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ScheduledIntervalHiveModel obj) {
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
      ..write(obj.intervalUnit)
      ..writeByte(12)
      ..write(obj.intervalValue)
      ..writeByte(13)
      ..write(obj.repeatCount)
      ..writeByte(14)
      ..write(obj.scheduledTimeIds)
      ..writeByte(15)
      ..write(obj.startDate)
      ..writeByte(16)
      ..write(obj.consecutiveOccurrences);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduledIntervalHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
