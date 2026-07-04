// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_range_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeRangeHiveModelAdapter extends TypeAdapter<TimeRangeHiveModel> {
  @override
  final typeId = 24;

  @override
  TimeRangeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeRangeHiveModel(
      id: fields[0] as String,
      createdAt: fields[2] as DateTime,
      ownerId: fields[1] as String,
      parentId: fields[10] as String,
      start: (fields[11] as num).toInt(),
      end: (fields[12] as num).toInt(),
      updatedAt: fields[4] as DateTime?,
      description: fields[3] as String?,
      order: (fields[5] as num?)?.toInt(),
      sharedWithUserIds: fields[8] == null
          ? const []
          : (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, TimeRangeHiveModel obj) {
    writer
      ..writeByte(10)
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
      ..write(obj.parentId)
      ..writeByte(11)
      ..write(obj.start)
      ..writeByte(12)
      ..write(obj.end);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeRangeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
