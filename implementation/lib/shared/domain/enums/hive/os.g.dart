// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'os.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OSAdapter extends TypeAdapter<OS> {
  @override
  final typeId = 116;

  @override
  OS read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return OS.android;
      case 1:
        return OS.ios;
      case 2:
        return OS.web;
      case 3:
        return OS.windows;
      case 4:
        return OS.macos;
      case 5:
        return OS.linux;
      case 6:
        return OS.unknown;
      default:
        return OS.android;
    }
  }

  @override
  void write(BinaryWriter writer, OS obj) {
    switch (obj) {
      case OS.android:
        writer.writeByte(0);
      case OS.ios:
        writer.writeByte(1);
      case OS.web:
        writer.writeByte(2);
      case OS.windows:
        writer.writeByte(3);
      case OS.macos:
        writer.writeByte(4);
      case OS.linux:
        writer.writeByte(5);
      case OS.unknown:
        writer.writeByte(6);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OSAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
