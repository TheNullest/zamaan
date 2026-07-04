// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_constraint.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoalConstraintAdapter extends TypeAdapter<GoalConstraint> {
  @override
  final typeId = 112;

  @override
  GoalConstraint read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GoalConstraint.min;
      case 1:
        return GoalConstraint.max;
      case 2:
        return GoalConstraint.exact;
      case 3:
        return GoalConstraint.range;
      case 4:
        return GoalConstraint.approx;
      case 5:
        return GoalConstraint.percent;
      case 6:
        return GoalConstraint.step;
      default:
        return GoalConstraint.min;
    }
  }

  @override
  void write(BinaryWriter writer, GoalConstraint obj) {
    switch (obj) {
      case GoalConstraint.min:
        writer.writeByte(0);
      case GoalConstraint.max:
        writer.writeByte(1);
      case GoalConstraint.exact:
        writer.writeByte(2);
      case GoalConstraint.range:
        writer.writeByte(3);
      case GoalConstraint.approx:
        writer.writeByte(4);
      case GoalConstraint.percent:
        writer.writeByte(5);
      case GoalConstraint.step:
        writer.writeByte(6);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalConstraintAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
