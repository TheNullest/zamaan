// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayTypeAdapter extends TypeAdapter<DayType> {
  @override
  final typeId = 111;

  @override
  DayType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DayType.weekDay;
      case 1:
        return DayType.monthDay;
      case 2:
        return DayType.fixedDate;
      default:
        return DayType.weekDay;
    }
  }

  @override
  void write(BinaryWriter writer, DayType obj) {
    switch (obj) {
      case DayType.weekDay:
        writer.writeByte(0);
      case DayType.monthDay:
        writer.writeByte(1);
      case DayType.fixedDate:
        writer.writeByte(2);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
