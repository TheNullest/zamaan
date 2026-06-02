import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:zamaan/features/sync/domain/enums/os.dart';
import 'package:zamaan/features/sync/domain/utils/device_info.dart';

/// A utility function to retrieve comprehensive metadata about the current
/// hardware and application environment.
///
/// This function aggregates data from [DeviceInfoPlugin] and [PackageInfo]
/// to create a unified [DeviceInfo] object. It uses the Dart 3 `switch`
/// expression for type-safe pattern matching across different platforms.
///
/// ▸ Supported Platforms:
/// - **Web**: Captures user agent and browser info.
/// - **Windows**: Captures device ID, build lab, and detailed versioning.
/// - **Android**: Captures hardware manufacturer, model, and SDK release.
/// - **iOS**: Captures vendor identifier and machine hardware name.
/// - **Linux**: Captures machine ID and kernel version.
///
/// ▸ Usage:
/// This is typically called during app initialization or before a
/// synchronization event to populate a `DeviceEntity`.
///
/// Returns a [Future] that completes with a populated [DeviceInfo] instance.
Future<DeviceInfo> getDeviceInfo() async {
  final deviceInfo = DeviceInfoPlugin();
  final packageInfo = await PackageInfo.fromPlatform();
  return switch (deviceInfo) {
    final WebBrowserInfo web => DeviceInfo(
      deviceId: web.userAgent ?? 'Unknown',
      os: OS.web,
      osVersion: web.userAgent ?? 'Unknown',
      manufacturer: 'Unknown',
      model: 'Unknown',
      appVersion: packageInfo.version,
    ),
    final WindowsDeviceInfo windows => DeviceInfo(
      deviceId: windows.deviceId,
      os: OS.windows,
      osVersion:
          '${windows.displayVersion} ${windows.majorVersion} ${windows.minorVersion} ${windows.csdVersion}',
      manufacturer: windows.buildLab,
      model: windows.platformId.toString(),
      appVersion: packageInfo.version,
    ),
    final AndroidDeviceInfo android => DeviceInfo(
      deviceId: android.id,
      os: OS.android,
      osVersion: android.version.release,
      manufacturer: android.manufacturer,
      model: android.model,
      appVersion: packageInfo.version,
    ),
    final IosDeviceInfo ios => DeviceInfo(
      deviceId: ios.identifierForVendor.toString(),
      os: OS.ios,
      osVersion: ios.systemVersion,
      manufacturer: ios.utsname.machine,
      model: ios.name,
      appVersion: packageInfo.version,
    ),
    final MacOsDeviceInfo macos => DeviceInfo(
      deviceId: macos.systemGUID ?? 'Unknown',
      os: OS.macos,
      osVersion: '${macos.majorVersion}.${macos.minorVersion}.${macos.patchVersion}',
      manufacturer: 'Apple',
      model: macos.model,
      appVersion: packageInfo.version,
    ),
    final LinuxDeviceInfo linux => DeviceInfo(
      deviceId: linux.id,
      os: OS.linux,
      osVersion: linux.version ?? 'Unknown',
      manufacturer: linux.machineId ?? 'Unknown',
      model: linux.buildId ?? 'Unknown',
      appVersion: packageInfo.version,
    ),
    _ => DeviceInfo(
      deviceId: 'Unknown',
      os: OS.unknown,
      osVersion: 'Unknown',
      manufacturer: 'Unknown',
      model: 'Unknown',
      appVersion: packageInfo.version,
    ),
  };
}
