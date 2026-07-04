// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_task_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubTaskHiveModelAdapter extends TypeAdapter<SubTaskHiveModel> {
  @override
  final typeId = 13;

  @override
  SubTaskHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubTaskHiveModel(
      id: fields[0] as String,
      createdAt: fields[2] as DateTime,
      ownerId: fields[1] as String,
      taskId: fields[10] as String,
      priority: fields[11] as Priority,
      title: fields[12] as String,
      status: fields[13] as TaskStatus,
      totalSpentTime: fields[14] as Duration?,
      updatedAt: fields[4] as DateTime?,
      description: fields[3] as String?,
      order: (fields[5] as num?)?.toInt(),
      sharedWithUserIds: fields[8] == null
          ? const []
          : (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, SubTaskHiveModel obj) {
    writer
      ..writeByte(12)
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
      ..write(obj.priority)
      ..writeByte(12)
      ..write(obj.title)
      ..writeByte(13)
      ..write(obj.status)
      ..writeByte(14)
      ..write(obj.totalSpentTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubTaskHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
