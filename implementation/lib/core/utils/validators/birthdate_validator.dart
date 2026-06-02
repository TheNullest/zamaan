/// Result object returned by [BirthdateValidatorExtension.validateBirthdate], containing validation status and message.
class BirthdateValidationResult {

  const BirthdateValidationResult({required this.isValid, this.errorMessage});
  /// True if birthdate is valid
  final bool isValid;

  /// Error message if invalid, null if valid
  final String? errorMessage;
}

/// Extension on nullable [DateTime] for birthdate validation.
extension BirthdateValidatorExtension on DateTime? {
  /// Validates the current [DateTime] as a birthdate.
  ///
  /// Returns an error if the date is null, in the future, or age is outside [minAge]–[maxAge].
  BirthdateValidationResult validateBirthdate({int minAge = 1, int maxAge = 120}) {
    if (this == null) {
      return const BirthdateValidationResult(
        isValid: false,
        errorMessage: 'Birthdate is required',
      );
    }

    final now = DateTime.now();

    if (this!.isAfter(now)) {
      return const BirthdateValidationResult(
        isValid: false,
        errorMessage: 'Birthdate cannot be in the future',
      );
    }

    final age = now.year -
        this!.year -
        ((now.month < this!.month || (now.month == this!.month && now.day < this!.day)) ? 1 : 0);

    if (age < minAge) {
      return const BirthdateValidationResult(
        isValid: false,
        errorMessage: 'You are too young',
      );
    }

    if (age > maxAge) {
      return const BirthdateValidationResult(
        isValid: false,
        errorMessage: 'You are too old',
      );
    }

    return const BirthdateValidationResult(isValid: true);
  }
}
