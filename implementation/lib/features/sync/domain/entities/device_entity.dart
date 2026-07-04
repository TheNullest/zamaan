import 'package:zamaan/features/sync/domain/enums/os.dart';
import 'package:zamaan/shared/domain/entities/base_owned_entity.dart';

/// Represents a device registered within the application ecosystem.
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
  final OS os;

  /// Version of the operating system running on the device.
  final String osVersion;

  /// Version of the application installed on the device.
  final String appVersion;

  /// Name of the device manufacturer (e.g., Samsung, Apple).
  final String manufacturer;

  /// Model name or number of the device.
  final String model;

  /// Timestamp indicating the last known activity of the device.
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
