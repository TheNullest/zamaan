// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_range_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DateRangeHiveModelAdapter extends TypeAdapter<DateRangeHiveModel> {
  @override
  final typeId = 23;

  @override
  DateRangeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DateRangeHiveModel(
      id: fields[0] as String,
      createdAt: fields[2] as DateTime,
      ownerId: fields[1] as String,
      parentId: fields[10] as String,
      startDate: fields[11] as DateTime?,
      endDate: fields[12] as DateTime?,
      updatedAt: fields[4] as DateTime?,
      description: fields[3] as String?,
      order: (fields[5] as num?)?.toInt(),
      sharedWithUserIds: fields[8] == null
          ? const []
          : (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, DateRangeHiveModel obj) {
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
      ..write(obj.startDate)
      ..writeByte(12)
      ..write(obj.endDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateRangeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
