// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskStatusAdapter extends TypeAdapter<TaskStatus> {
  @override
  final typeId = 122;

  @override
  TaskStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskStatus.inProgress;
      case 1:
        return TaskStatus.paused;
      case 2:
        return TaskStatus.done;
      case 3:
        return TaskStatus.overdue;
      case 4:
        return TaskStatus.doneLate;
      case 5:
        return TaskStatus.failed;
      case 6:
        return TaskStatus.cancelled;
      case 7:
        return TaskStatus.scheduled;
      case 8:
        return TaskStatus.pending;
      default:
        return TaskStatus.inProgress;
    }
  }

  @override
  void write(BinaryWriter writer, TaskStatus obj) {
    switch (obj) {
      case TaskStatus.inProgress:
        writer.writeByte(0);
      case TaskStatus.paused:
        writer.writeByte(1);
      case TaskStatus.done:
        writer.writeByte(2);
      case TaskStatus.overdue:
        writer.writeByte(3);
      case TaskStatus.doneLate:
        writer.writeByte(4);
      case TaskStatus.failed:
        writer.writeByte(5);
      case TaskStatus.cancelled:
        writer.writeByte(6);
      case TaskStatus.scheduled:
        writer.writeByte(7);
      case TaskStatus.pending:
        writer.writeByte(8);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
