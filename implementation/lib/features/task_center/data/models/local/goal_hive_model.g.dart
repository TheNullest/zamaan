// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalHiveModelAdapter extends TypeAdapter<GoalHiveModel> {
  @override
  final typeId = 15;

  @override
  GoalHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoalHiveModel(
      id: fields[0] as String,
      createdAt: fields[2] as DateTime,
      ownerId: fields[1] as String,
      refType: fields[10] as ReferenceType,
      refId: fields[11] as String,
      measurementUnit: fields[12] as MeasurementUnit,
      goalConstraint: fields[13] as GoalConstraint,
      customMeasurementUnitId: fields[14] as String?,
      goalTargets: (fields[15] as Map).cast<int, dynamic>(),
      updatedAt: fields[4] as DateTime?,
      description: fields[3] as String?,
      order: (fields[5] as num?)?.toInt(),
      sharedWithUserIds: fields[8] == null
          ? const []
          : (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, GoalHiveModel obj) {
    writer
      ..writeByte(13)
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
      ..write(obj.refType)
      ..writeByte(11)
      ..write(obj.refId)
      ..writeByte(12)
      ..write(obj.measurementUnit)
      ..writeByte(13)
      ..write(obj.goalConstraint)
      ..writeByte(14)
      ..write(obj.customMeasurementUnitId)
      ..writeByte(15)
      ..write(obj.goalTargets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
