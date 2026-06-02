import 'package:zamaan/features/sync/domain/enums/os.dart';

class DeviceInfo {
  const DeviceInfo({
    required this.deviceId,
    required this.os,
    required this.osVersion,
    required this.manufacturer,
    required this.model,
    required this.appVersion,
  });
  final String deviceId;
  final OS os;
  final String osVersion;
  final String manufacturer;
  final String model;
  final String appVersion;
}
