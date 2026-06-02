import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zamaan/core/base/base_owned_entity.dart';

/// Represents a synchronization log entry for tracking device sync operations.
@HiveType(typeId: 31)
class SyncLogEntity extends BaseOwnedEntity {
  SyncLogEntity({
    required super.id,
    required super.userId,
    required super.createdAt, // When the sync was initiated
    required this.deviceId,
    required this.logEntityId, // Changed from syncLogId to clarify it points to LogEntity
    this.isSynced = false,
    this.syncedAt,
  });

  /// Identifier for the device associated with the synchronization operation.
  @HiveField(11)
  final String deviceId;

  /// Identifier linking this sync status to a specific LogEntity (Event).
  @HiveField(12)
  final String logEntityId;

  /// Indicates whether the synchronization has been completed.
  @HiveField(13)
  final bool isSynced;

  /// Timestamp indicating when the synchronization was successfully completed.
  @HiveField(14)
  final DateTime? syncedAt;

  SyncLogEntity copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    String? deviceId,
    String? logEntityId,
    bool? isSynced,
    DateTime? syncedAt,
  }) {
    return SyncLogEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      deviceId: deviceId ?? this.deviceId,
      logEntityId: logEntityId ?? this.logEntityId,
      isSynced: isSynced ?? this.isSynced,
      syncedAt: syncedAt ?? this.syncedAt,
    );
  }

  @override
  List<Object?> get props => [...super.props, deviceId, logEntityId, isSynced, syncedAt];
}
