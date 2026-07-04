import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:zamaan/core/constants/hive_type_ids.dart';
import 'package:zamaan/core/extensions/string.dart';

part 'registration_status.g.dart';

/// Represents the different registration statuses a user can have.
@HiveType(typeId: EnumHiveTypeIds.registrationStatus)
enum RegistrationStatus {
  @HiveField(0)
  unregistered, // no remote account yet

  @HiveField(1)
  registered; // full email/password account

  /// Converts a string name (case-insensitive) to a [RegistrationStatus] enum value.
  /// Matches common variations like 'unregistered' or 'registered'.
  ///
  /// Throws a [FormatException] if the name does not match any status.
  static RegistrationStatus fromName(String name) {
    // Using lowercase for case-insensitive matching
    final lowerCaseName = name.toLowerCase().replaceAll(' ', ''); // Normalize input
    return RegistrationStatus.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == lowerCaseName,
      orElse: () => throw FormatException('Invalid RegistrationStatus name: $name'),
    );
  }

  /// Retrieves the English (Sentence Case) name using its index.
  /// Throws an exception if the index is invalid.
  static String fromIndex(int index) {
    if (index < 0 || index >= RegistrationStatus.values.length) {
      throw Exception('The RegistrationStatus index $index is not valid.');
    }
    final item = RegistrationStatus.values[index];
    return item.name;
  }

  /// Returns a user-friendly, sentence-cased string representation of the status.
  /// Example: `RegistrationStatus.unregistered.name` -> "Unregistered"
  String get name {
    return toString().split('.').last.toSentenceCase();
  }
}
