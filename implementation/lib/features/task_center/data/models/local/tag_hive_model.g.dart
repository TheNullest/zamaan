// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TagHiveModelAdapter extends TypeAdapter<TagHiveModel> {
  @override
  final typeId = 21;

  @override
  TagHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TagHiveModel(
      id: fields[0] as String,
      createdAt: fields[2] as DateTime,
      ownerId: fields[1] as String,
      title: fields[10] as String,
      colorCode: (fields[11] as num).toInt(),
      iconCode: (fields[12] as num).toInt(),
      taskId: fields[13] as String?,
      updatedAt: fields[4] as DateTime?,
      description: fields[3] as String?,
      order: (fields[5] as num?)?.toInt(),
      sharedWithUserIds: fields[8] == null
          ? const []
          : (fields[8] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, TagHiveModel obj) {
    writer
      ..writeByte(11)
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
      ..write(obj.colorCode)
      ..writeByte(12)
      ..write(obj.iconCode)
      ..writeByte(13)
      ..write(obj.taskId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TagHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
