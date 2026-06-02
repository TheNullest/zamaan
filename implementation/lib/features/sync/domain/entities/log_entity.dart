import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zamaan/core/base/base_owned_entity.dart';
import 'package:zamaan/core/utils/typedef.dart';
import 'package:zamaan/shared/domain/enums/hive/sync_action.dart';

/// Represents a log entry capturing changes within the application (Event Sourcing).
@HiveType(typeId: 30) // Assuming range 20-50 for Sync logic
class LogEntity extends BaseOwnedEntity {
  LogEntity({
    required super.id,
    required super.userId,
    required super.createdAt, // Replaces 'recordedAt'
    required this.deviceId,
    required this.entityId,
    required this.action,
    required this.data,
    required this.sequenceNumber, // NEW: Critical for race conditions
    this.isSynced = false,
  });

  /// Identifier for the device that generated the log entry.
  @HiveField(11)
  final String deviceId;

  /// Identifier for the entity affected by the logged action (e.g., Task ID).
  @HiveField(12)
  final String entityId;

  /// Type of action performed (e.g., create, update, delete).
  @HiveField(13)
  final SyncAction action;

  /// Additional data related to the action (The Payload).
  @HiveField(14)
  final DataMap data;

  /// Ensures strict ordering of offline events to prevent race conditions.
  @HiveField(15)
  final int sequenceNumber;

  /// Indicates whether the log entry has been synchronized across all devices.
  @HiveField(16)
  final bool isSynced;

  @override
  LogEntity copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    String? deviceId,
    String? entityId,
    SyncAction? action,
    DataMap? data,
    int? sequenceNumber,
    bool? isSynced,
  }) {
    return LogEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      deviceId: deviceId ?? this.deviceId,
      entityId: entityId ?? this.entityId,
      action: action ?? this.action,
      data: data ?? this.data,
      sequenceNumber: sequenceNumber ?? this.sequenceNumber,
      isSynced: isSynced ?? this.isSynced,
    );
  }

  @override
  List<Object?> get props => [
    ...super.props,
    deviceId,
    entityId,
    action,
    data,
    sequenceNumber,
    isSynced,
  ];
}
