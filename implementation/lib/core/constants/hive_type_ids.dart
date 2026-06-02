import 'package:hive_ce_flutter/adapters.dart' show TypeAdapter;
import 'package:hive_ce_flutter/hive_ce_flutter.dart' show TypeAdapter;
import 'package:hive_ce_flutter/hive_flutter.dart' show TypeAdapter;

/// Defines a centralized schema for Hive [TypeAdapter] identifiers.
///
/// This architectural approach prevents TypeId collisions by allocating
/// specific numeric ranges to different categories of data models.
///
/// Range 0-10: Reserved for base classes and core abstractions.
abstract class BaseHiveTypeIds {
  static const int baseEntityAbstraction = 0;
}

/// Identifiers for Core Domain Entities (Range: 11-110).
///
/// These IDs represent the primary business objects of the application.
/// They map directly to Domain Entities in the Clean Architecture layers
/// and are synchronized between Hive (Local) and Supabase (Remote).
abstract class ClassHiveTypeIds {
  static const int user = 11;
  static const int task = 12;
  static const int subTask = 13;
  static const int category = 14;
  static const int goal = 15;
  static const int customMeasurementUnit = 16;
  static const int scheduleConstraints = 17;
  static const int scheduledDayTime = 18;
  static const int scheduledInterval = 19;
  static const int scheduledOccurrence = 20;
  static const int tag = 21;
  static const int taskActivity = 22;
  static const int dateRange = 23;
  static const int timeRange = 24;
  static const int remoteSession = 25;
}

/// Identifiers for Enums and Value Objects (Range: 111-180).
///
/// These IDs are dedicated to categorical data, status indicators, and
/// configuration types. Grouping Enums in this range ensures that type-safe
/// constants do not interfere with the primary entity IDs.
abstract class EnumHiveTypeIds {
  static const int dayType = 111;
  static const int goalConstraint = 112;
  static const int intevalUnit = 113;
  static const int measurementCategory = 114;
  static const int measurementUnit = 115;
  static const int os = 116;
  static const int priority = 117;
  static const int referenceType = 118;
  static const int repetitionType = 119;
  static const int scheduleType = 120;
  static const int syncAction = 121;
  static const int taskStatus = 122;
  static const int weekDay = 123;
  static const int occurrenceStatus = 124;
  static const int scheduledTimeMode = 125;
}

/// Identifiers for Primitive Wrappers and Dart Native Types (Range: 181+).
///
/// Used for registering custom adapters for standard Dart classes that
/// are not natively supported by Hive's binary format but are essential
/// for business logic (e.g., [Duration] for time tracking).
abstract class DartClassHiveTypeIds {
  static const int duration = 181;
}
