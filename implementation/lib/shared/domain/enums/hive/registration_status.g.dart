// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistrationStatusAdapter extends TypeAdapter<RegistrationStatus> {
  @override
  final typeId = 126;

  @override
  RegistrationStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return RegistrationStatus.unregistered;
      case 1:
        return RegistrationStatus.registered;
      default:
        return RegistrationStatus.unregistered;
    }
  }

  @override
  void write(BinaryWriter writer, RegistrationStatus obj) {
    switch (obj) {
      case RegistrationStatus.unregistered:
        writer.writeByte(0);
      case RegistrationStatus.registered:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
