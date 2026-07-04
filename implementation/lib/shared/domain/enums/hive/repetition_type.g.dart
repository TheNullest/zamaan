// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repetition_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepetitionTypeAdapter extends TypeAdapter<RepetitionType> {
  @override
  final typeId = 119;

  @override
  RepetitionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RepetitionType.minutely;
      case 1:
        return RepetitionType.hourly;
      case 2:
        return RepetitionType.daily;
      case 3:
        return RepetitionType.weekdays;
      case 4:
        return RepetitionType.weekly;
      case 5:
        return RepetitionType.monthly;
      case 6:
        return RepetitionType.yearly;
      case 7:
        return RepetitionType.custom;
      default:
        return RepetitionType.minutely;
    }
  }

  @override
  void write(BinaryWriter writer, RepetitionType obj) {
    switch (obj) {
      case RepetitionType.minutely:
        writer.writeByte(0);
      case RepetitionType.hourly:
        writer.writeByte(1);
      case RepetitionType.daily:
        writer.writeByte(2);
      case RepetitionType.weekdays:
        writer.writeByte(3);
      case RepetitionType.weekly:
        writer.writeByte(4);
      case RepetitionType.monthly:
        writer.writeByte(5);
      case RepetitionType.yearly:
        writer.writeByte(6);
      case RepetitionType.custom:
        writer.writeByte(7);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepetitionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
