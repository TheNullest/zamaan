// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_constraints_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduleConstraintsHiveModelAdapter
    extends TypeAdapter<ScheduleConstraintsHiveModel> {
  @override
  final typeId = 17;

  @override
  ScheduleConstraintsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduleConstraintsHiveModel(
      id: fields[0] as String,
      createdAt: fields[2] as DateTime,
      ownerId: fields[1] as String,
      taskId: fields[10] as String,
      startDate: fields[11] as DateTime?,
      endDate: fields[12] as DateTime?,
      exceptionDates: (fields[13] as List).cast<DateTime>(),
      exceptionWeekDays: (fields[14] as List).cast<int>(),
      exceptionMonthDays: (fields[15] as List).cast<int>(),
      enforceScheduleBounds: fields[16] as bool,
      updatedAt: fields[4] as DateTime?,
      description: fields[3] as String?,
      order: (fields[5] as num?)?.toInt(),
      sharedWithUserIds: fields[8] == null
          ? const []
          : (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ScheduleConstraintsHiveModel obj) {
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
      ..write(obj.startDate)
      ..writeByte(12)
      ..write(obj.endDate)
      ..writeByte(13)
      ..write(obj.exceptionDates)
      ..writeByte(14)
      ..write(obj.exceptionWeekDays)
      ..writeByte(15)
      ..write(obj.exceptionMonthDays)
      ..writeByte(16)
      ..write(obj.enforceScheduleBounds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleConstraintsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
