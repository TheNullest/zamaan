import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zamaan/core/base/base_owned_entity.dart';
import 'package:zamaan/features/sync/domain/enums/os.dart';

/// Represents a device registered within the application ecosystem.
@HiveType(typeId: 32)
class DeviceEntity extends BaseOwnedEntity {
  DeviceEntity({
    required super.id,
    required super.userId,
    required super.createdAt, // Replaces 'registeredAt'
    required this.os,
    required this.osVersion,
    required this.appVersion,
    required this.manufacturer,
    required this.model,
    required this.lastActive,
  });

  /// Operating system of the device (e.g., Android, iOS).
  @HiveField(11)
  final OS os;

  /// Version of the operating system running on the device.
  @HiveField(12)
  final String osVersion;

  /// Version of the application installed on the device.
  @HiveField(13)
  final String appVersion;

  /// Name of the device manufacturer (e.g., Samsung, Apple).
  @HiveField(14)
  final String manufacturer;

  /// Model name or number of the device.
  @HiveField(15)
  final String model;

  /// Timestamp indicating the last known activity of the device.
  @HiveField(16)
  final DateTime lastActive;

  DeviceEntity copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    OS? os,
    String? osVersion,
    String? appVersion,
    String? manufacturer,
    String? model,
    DateTime? lastActive,
  }) {
    return DeviceEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      os: os ?? this.os,
      osVersion: osVersion ?? this.osVersion,
      appVersion: appVersion ?? this.appVersion,
      manufacturer: manufacturer ?? this.manufacturer,
      model: model ?? this.model,
      lastActive: lastActive ?? this.lastActive,
    );
  }

  @override
  List<Object?> get props => [
    ...super.props,
    os,
    osVersion,
    appVersion,
    manufacturer,
    model,
    lastActive,
  ];
}
