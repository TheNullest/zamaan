// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeasurementCategoryAdapter extends TypeAdapter<MeasurementCategory> {
  @override
  final typeId = 114;

  @override
  MeasurementCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MeasurementCategory.length;
      case 1:
        return MeasurementCategory.mass;
      case 2:
        return MeasurementCategory.area;
      case 3:
        return MeasurementCategory.time;
      case 4:
        return MeasurementCategory.currency;
      case 5:
        return MeasurementCategory.volume;
      case 6:
        return MeasurementCategory.count;
      case 7:
        return MeasurementCategory.custom;
      default:
        return MeasurementCategory.length;
    }
  }

  @override
  void write(BinaryWriter writer, MeasurementCategory obj) {
    switch (obj) {
      case MeasurementCategory.length:
        writer.writeByte(0);
      case MeasurementCategory.mass:
        writer.writeByte(1);
      case MeasurementCategory.area:
        writer.writeByte(2);
      case MeasurementCategory.time:
        writer.writeByte(3);
      case MeasurementCategory.currency:
        writer.writeByte(4);
      case MeasurementCategory.volume:
        writer.writeByte(5);
      case MeasurementCategory.count:
        writer.writeByte(6);
      case MeasurementCategory.custom:
        writer.writeByte(7);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasurementCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
