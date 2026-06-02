// lib/core/utils/validators/name_validator.dart

class NameValidator {
  // ===========================================================================
  // Configuration
  // ===========================================================================

  static const int _defaultMinLength = 1;
  static const int _defaultMaxLength = 50;
  static const bool _defaultAllowSpaces = false;
  static const bool _defaultAllowHyphens = true;
  static const bool _defaultAllowApostrophes = true;

  // ===========================================================================
  // Prohibited Patterns & Words
  // ===========================================================================

  /// Common prohibited words (profanity, reserved terms, etc.)
  static const _prohibitedWords = {
    'admin', 'administrator', 'root', 'system', 'null', 'undefined',
    'unknown', 'test', 'demo', 'sample', 'user', 'username', 'name',
    'firstname', 'lastname', 'invalid', 'fake', 'dummy', 'anonymous',
    'guest', 'default', 'void', 'empty',
    // Add more as needed for your application
  };

  /// Regex patterns for invalid content
  static final _invalidPatterns = [
    RegExp(r'\d'), // Numbers
    RegExp(r'[!@#$%^&*()_+=|<>?{}[\]~]'), // Special characters
    RegExp(r'\.{2,}'), // Multiple consecutive dots
    RegExp('-{2,}'), // Multiple consecutive hyphens
    RegExp("'{2,}"), // Multiple consecutive apostrophes
    RegExp(r'\s{2,}'), // Multiple consecutive spaces
  ];

  /// Regex for valid name characters
  static final _validNameRegex = RegExp(r"^[a-zA-ZÀ-ÿ\s'\-]+$");

  // ===========================================================================
  // Main Validation Methods
  // ===========================================================================

  /// Validates a first name with configurable rules
  static NameValidationResult validateFirstName(
    String name, {
    int minLength = _defaultMinLength,
    int maxLength = _defaultMaxLength,
    bool allowSpaces = _defaultAllowSpaces,
    bool allowHyphens = _defaultAllowHyphens,
    bool allowApostrophes = _defaultAllowApostrophes,
    Set<String> additionalProhibitedWords = const {},
  }) {
    return _validateName(
      name,
      'First name',
      minLength: minLength,
      maxLength: maxLength,
      allowSpaces: allowSpaces,
      allowHyphens: allowHyphens,
      allowApostrophes: allowApostrophes,
      additionalProhibitedWords: additionalProhibitedWords,
    );
  }

  /// Validates a last name with configurable rules
  static NameValidationResult validateLastName(
    String name, {
    int minLength = _defaultMinLength,
    int maxLength = _defaultMaxLength,
    bool allowSpaces = true, // Last names often have spaces
    bool allowHyphens = _defaultAllowHyphens,
    bool allowApostrophes = _defaultAllowApostrophes,
    Set<String> additionalProhibitedWords = const {},
  }) {
    return _validateName(
      name,
      'Last name',
      minLength: minLength,
      maxLength: maxLength,
      allowSpaces: allowSpaces,
      allowHyphens: allowHyphens,
      allowApostrophes: allowApostrophes,
      additionalProhibitedWords: additionalProhibitedWords,
    );
  }

  /// Validates any generic name
  static NameValidationResult validateName(
    String name, {
    String fieldName = 'Name',
    int minLength = _defaultMinLength,
    int maxLength = _defaultMaxLength,
    bool allowSpaces = _defaultAllowSpaces,
    bool allowHyphens = _defaultAllowHyphens,
    bool allowApostrophes = _defaultAllowApostrophes,
    Set<String> additionalProhibitedWords = const {},
  }) {
    return _validateName(
      name,
      fieldName,
      minLength: minLength,
      maxLength: maxLength,
      allowSpaces: allowSpaces,
      allowHyphens: allowHyphens,
      allowApostrophes: allowApostrophes,
      additionalProhibitedWords: additionalProhibitedWords,
    );
  }

  // ===========================================================================
  // Quick Validation Methods
  // ===========================================================================

  /// Quick check if first name is valid
  static bool isFirstNameValid(String name, {bool allowSpaces = false}) {
    return validateFirstName(name, allowSpaces: allowSpaces).isValid;
  }

  /// Quick check if last name is valid
  static bool isLastNameValid(String name, {bool allowSpaces = true}) {
    return validateLastName(name, allowSpaces: allowSpaces).isValid;
  }

  // ===========================================================================
  // Private Implementation
  // ===========================================================================

  static NameValidationResult _validateName(
    String name,
    String fieldName, {
    required int minLength,
    required int maxLength,
    required bool allowSpaces,
    required bool allowHyphens,
    required bool allowApostrophes,
    required Set<String> additionalProhibitedWords,
  }) {
    final normalizedName = _normalizeName(name);

    // Check empty
    if (normalizedName.isEmpty) {
      return NameValidationResult.invalid(NameError.empty, fieldName: fieldName);
    }

    // Check length
    if (normalizedName.length < minLength) {
      return NameValidationResult.invalid(
        NameError.tooShort,
        fieldName: fieldName,
        details: {'minLength': minLength, 'actualLength': normalizedName.length},
      );
    }

    if (normalizedName.length > maxLength) {
      return NameValidationResult.invalid(
        NameError.tooLong,
        fieldName: fieldName,
        details: {'maxLength': maxLength, 'actualLength': normalizedName.length},
      );
    }

    // Check valid characters
    if (!_hasValidCharacters(normalizedName, allowSpaces, allowHyphens, allowApostrophes)) {
      return NameValidationResult.invalid(
        NameError.invalidCharacters,
        fieldName: fieldName,
        details: {
          'allowSpaces': allowSpaces,
          'allowHyphens': allowHyphens,
          'allowApostrophes': allowApostrophes,
        },
      );
    }

    // Check for invalid patterns
    final patternError = _checkInvalidPatterns(normalizedName);
    if (patternError != null) {
      return NameValidationResult.invalid(patternError, fieldName: fieldName);
    }

    // Check for prohibited words
    final prohibitedError = _checkProhibitedWords(
      normalizedName,
      additionalProhibitedWords,
    );
    if (prohibitedError != null) {
      return NameValidationResult.invalid(prohibitedError, fieldName: fieldName);
    }

    // Check name structure
    final structureError = _checkNameStructure(normalizedName, allowSpaces);
    if (structureError != null) {
      return NameValidationResult.invalid(structureError, fieldName: fieldName);
    }

    return NameValidationResult.valid(
      name: normalizedName,
      fieldName: fieldName,
    );
  }

  static String _normalizeName(String name) {
    return name.trim();
  }

  static bool _hasValidCharacters(
    String name,
    bool allowSpaces,
    bool allowHyphens,
    bool allowApostrophes,
  ) {
    // Start with basic letter validation
    if (!_validNameRegex.hasMatch(name)) {
      return false;
    }

    // Check specific character restrictions
    if (!allowSpaces && name.contains(' ')) {
      return false;
    }

    if (!allowHyphens && name.contains('-')) {
      return false;
    }

    if (!allowApostrophes && name.contains("'")) {
      return false;
    }

    return true;
  }

  static NameError? _checkInvalidPatterns(String name) {
    for (final pattern in _invalidPatterns) {
      if (pattern.hasMatch(name)) {
        return NameError.invalidPattern;
      }
    }
    return null;
  }

  static NameError? _checkProhibitedWords(
    String name,
    Set<String> additionalProhibitedWords,
  ) {
    final allProhibitedWords = {..._prohibitedWords, ...additionalProhibitedWords};
    final lowerName = name.toLowerCase();

    for (final word in allProhibitedWords) {
      // Exact match or contains as separate word
      if (lowerName == word.toLowerCase() ||
          RegExp('\\b${RegExp.escape(word)}\\b', caseSensitive: false).hasMatch(lowerName)) {
        return NameError.prohibitedWord;
      }
    }

    return null;
  }

  static NameError? _checkNameStructure(String name, bool allowSpaces) {
    // Check for consecutive special characters
    if (RegExp(r"''|--|\s\s").hasMatch(name)) {
      return NameError.consecutiveSpecialChars;
    }

    // Check for leading/trailing special characters
    if (name.startsWith(' ') ||
        name.endsWith(' ') ||
        name.startsWith('-') ||
        name.endsWith('-') ||
        name.startsWith("'") ||
        name.endsWith("'")) {
      return NameError.invalidStructure;
    }

    // If spaces are allowed but name has multiple words, check each part
    if (allowSpaces && name.contains(' ')) {
      final parts = name.split(' ').where((part) => part.isNotEmpty);

      // Each part should be at least 2 characters (or 1 if culturally appropriate)
      for (final part in parts) {
        if (part.isEmpty) {
          return NameError.invalidStructure;
        }

        // Check if part starts/ends with special characters
        if (part.startsWith('-') ||
            part.endsWith('-') ||
            part.startsWith("'") ||
            part.endsWith("'")) {
          return NameError.invalidStructure;
        }
      }
    }

    // Check capitalization (suggestion, not error)
    if (name != name.toUpperCase() && name != name.toLowerCase()) {
      // Mixed case is generally good
    }

    return null;
  }

  // ===========================================================================
  // Utility Methods
  // ===========================================================================

  /// Formats a name with proper capitalization
  static String formatName(String name) {
    if (name.isEmpty) return name;

    final trimmed = name.trim();

    // Handle names with spaces (like "mary jane")
    if (trimmed.contains(' ')) {
      return trimmed.split(' ').map((part) {
        if (part.isEmpty) return part;
        return part[0].toUpperCase() + part.substring(1).toLowerCase();
      }).join(' ');
    }

    // Handle hyphenated names (like "mary-anne")
    if (trimmed.contains('-')) {
      return trimmed.split('-').map((part) {
        if (part.isEmpty) return part;
        return part[0].toUpperCase() + part.substring(1).toLowerCase();
      }).join('-');
    }

    // Simple name
    return trimmed[0].toUpperCase() + trimmed.substring(1).toLowerCase();
  }

  /// Extracts suggestions for name improvement
  static List<String> getSuggestions(String name, String fieldName) {
    final suggestions = <String>[];
    final normalized = _normalizeName(name);

    if (normalized != formatName(normalized)) {
      suggestions.add('Consider formatting as "${formatName(normalized)}"');
    }

    if (normalized.contains('  ')) {
      suggestions.add('Remove extra spaces');
    }

    if (RegExp(r'\d').hasMatch(normalized)) {
      suggestions.add('Remove numbers from $fieldName');
    }

    return suggestions;
  }
}

// ===========================================================================
// Supporting Enums and Classes
// ===========================================================================

enum NameError {
  empty,
  tooShort,
  tooLong,
  invalidCharacters,
  invalidPattern,
  prohibitedWord,
  consecutiveSpecialChars,
  invalidStructure,
}

class NameValidationResult {

  NameValidationResult.valid({
    required this.name,
    required this.fieldName,
    this.suggestions = const [],
  })  : isValid = true,
        error = null,
        details = null;

  NameValidationResult.invalid(
    this.error, {
    required this.fieldName,
    this.details,
    this.suggestions = const [],
  })  : isValid = false,
        name = null;
  final bool isValid;
  final NameError? error;
  final String? name;
  final String fieldName;
  final Map<String, dynamic>? details;
  final List<String> suggestions;

  String? get errorMessage => _getErrorMessage();

  String _getErrorMessage() {
    switch (error) {
      case NameError.empty:
        return '$fieldName cannot be empty';
      case NameError.tooShort:
        final min = details?['minLength'] ?? 1;
        return '$fieldName must be at least $min characters';
      case NameError.tooLong:
        final max = details?['maxLength'] ?? 50;
        return '$fieldName cannot exceed $max characters';
      case NameError.invalidCharacters:
        return '$fieldName contains invalid characters';
      case NameError.invalidPattern:
        return '$fieldName contains invalid patterns';
      case NameError.prohibitedWord:
        return '$fieldName contains prohibited words';
      case NameError.consecutiveSpecialChars:
        return '$fieldName has consecutive special characters';
      case NameError.invalidStructure:
        return '$fieldName has invalid structure';
      case null:
        return 'Unknown error';
    }
  }

  Map<String, dynamic> toJson() => {
        'isValid': isValid,
        'error': error?.name,
        'name': name,
        'fieldName': fieldName,
        'errorMessage': errorMessage,
        'suggestions': suggestions,
      };
}

// ===========================================================================
// Extension for Easy Usage
// ===========================================================================

extension NameValidationExtension on String {
  NameValidationResult validateFirstName({
    int minLength = 1,
    int maxLength = 50,
    bool allowSpaces = false,
    bool allowHyphens = true,
    bool allowApostrophes = true,
    Set<String> prohibitedWords = const {},
  }) {
    return NameValidator.validateFirstName(
      this,
      minLength: minLength,
      maxLength: maxLength,
      allowSpaces: allowSpaces,
      allowHyphens: allowHyphens,
      allowApostrophes: allowApostrophes,
      additionalProhibitedWords: prohibitedWords,
    );
  }

  NameValidationResult validateLastName({
    int minLength = 1,
    int maxLength = 50,
    bool allowSpaces = true,
    bool allowHyphens = true,
    bool allowApostrophes = true,
    Set<String> prohibitedWords = const {},
  }) {
    return NameValidator.validateLastName(
      this,
      minLength: minLength,
      maxLength: maxLength,
      allowSpaces: allowSpaces,
      allowHyphens: allowHyphens,
      allowApostrophes: allowApostrophes,
      additionalProhibitedWords: prohibitedWords,
    );
  }

  bool get isValidFirstName => NameValidator.isFirstNameValid(this);
  bool get isValidLastName => NameValidator.isLastNameValid(this);

  String get formattedName => NameValidator.formatName(this);
}
