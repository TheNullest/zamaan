// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_measurement_unit_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomMeasurementUnitHiveModelAdapter
    extends TypeAdapter<CustomMeasurementUnitHiveModel> {
  @override
  final typeId = 16;

  @override
  CustomMeasurementUnitHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomMeasurementUnitHiveModel(
      id: fields[0] as String,
      createdAt: fields[2] as DateTime,
      ownerId: fields[1] as String,
      title: fields[10] as String,
      isDouble: fields[11] as bool,
      iconCode: (fields[12] as num).toInt(),
      updatedAt: fields[4] as DateTime?,
      description: fields[3] as String?,
      order: (fields[5] as num?)?.toInt(),
      sharedWithUserIds: fields[8] == null
          ? const []
          : (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CustomMeasurementUnitHiveModel obj) {
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
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.isDouble)
      ..writeByte(12)
      ..write(obj.iconCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomMeasurementUnitHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
