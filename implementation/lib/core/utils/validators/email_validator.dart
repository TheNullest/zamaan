// lib/core/utils/validators/email_validator.dart

import 'dart:async';

/// Comprehensive email validation with multiple verification levels
/// Supports syntax validation, domain checking, and disposable email detection
class EmailValidator {
  // ===========================================================================
  // Regex Patterns
  // ===========================================================================

  /// RFC 5322 Official Standard Email Regex
  static final _rfc5322Regex = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$",
    caseSensitive: false,
  );

  /// Practical Email Regex (more commonly used)
  static final _practicalRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    caseSensitive: false,
  );

  /// Simple Email Regex for quick checks
  static final _simpleRegex = RegExp(
    r'^[^@]+@[^@]+\.[^@]+$',
    caseSensitive: false,
  );

  // ===========================================================================
  // Disposable Email Domains
  // ===========================================================================

  static const _disposableDomains = {
    'tempmail.com',
    'guerrillamail.com',
    'mailinator.com',
    '10minutemail.com',
    'throwawaymail.com',
    'fakeinbox.com',
    'yopmail.com',
    'getairmail.com',
    'tmpmail.org',
    'dispostable.com',
    'maildrop.cc',
    'getnada.com',
    'temp-mail.org',
    'trashmail.com',
    'sharklasers.com',
    'grr.la',
    'guerrillamail.net',
    'guerrillamail.org',
    'guerrillamail.biz',
    'spam4.me',
    'spamgourmet.com',
    'burnermail.io',
    'temp-mail.io',
    'anonbox.net',
    'jetable.org',
    'mailnesia.com',
    'mytrashmail.com',
    'tempail.com',
    'emailondeck.com',
    'throwawayemailaddress.com',
    'mailmetrash.com',
    'trashmailer.com',
    'discard.email',
    'tempemail.net',
    'deadaddress.com',
    'get2mail.fr',
    'tmails.net',
    'email-temp.com',
    'fake-mail.com',
    'mintemail.com',
    '33mail.com',
    'incognito.email',
    'tmpmail.net',
    'mail-temp.com',
    'tempinbox.com',
    'email-fake.com',
    'fakemail.net',
    'fakemailgenerator.com',
    'mailinator.net',
    'notsharingmy.org',
    'zippymail.info',
    'smellfear.com',
    'link2mail.net',
    'mailmoat.com',
    'dodgit.com',
    'sogetthis.com',
    'spamherelots.com',
    'thisisnotmyrealemail.com',
    'dontsendspam.org',
    'mailnull.com',
    'spamcero.com',
    'objectmail.com',
    'spamday.com',
    'wegwerfmail.de',
    'wegwerfmail.net',
    'wegwerfmail.org',
  };

  // ===========================================================================
  // Public Validation Methods
  // ===========================================================================

  /// Comprehensive email validation with multiple checks
  static EmailValidationResult validate(
    String email, {
    ValidationLevel level = ValidationLevel.standard,
    bool checkDisposable = true,
    bool checkDomain = false,
  }) {
    final normalizedEmail = _normalizeEmail(email);

    // Basic checks
    if (normalizedEmail.isEmpty) {
      return EmailValidationResult.invalid(EmailError.empty);
    }

    if (normalizedEmail.length > 254) {
      return EmailValidationResult.invalid(EmailError.tooLong);
    }

    // Syntax validation
    if (!_validateSyntax(normalizedEmail, level)) {
      return EmailValidationResult.invalid(EmailError.invalidFormat);
    }

    // Structural checks
    final structureError = _validateStructure(normalizedEmail);
    if (structureError != null) {
      return EmailValidationResult.invalid(structureError);
    }

    // Advanced checks based on level
    if (level == ValidationLevel.rfc) {
      final advancedError = _validateAdvanced(normalizedEmail);
      if (advancedError != null) {
        return EmailValidationResult.invalid(advancedError);
      }
    }

    // Disposable email check
    if (checkDisposable && _isDisposableEmail(normalizedEmail)) {
      return EmailValidationResult.invalid(EmailError.disposable);
    }

    // Domain validation (async operation would be separate)
    if (checkDomain) {
      // This would typically be an async operation
      // For now, we just check if domain looks valid
      if (!_hasValidDomain(normalizedEmail)) {
        return EmailValidationResult.invalid(EmailError.invalidDomain);
      }
    }

    return EmailValidationResult.valid(
      email: normalizedEmail,
      suggestions: _getSuggestions(normalizedEmail),
    );
  }

  /// Quick validation for basic format checking
  static bool isValid(String email, {ValidationLevel level = ValidationLevel.basic}) {
    final normalizedEmail = _normalizeEmail(email);
    if (normalizedEmail.isEmpty || normalizedEmail.length > 254) {
      return false;
    }
    return _validateSyntax(normalizedEmail, level);
  }

  /// Async domain verification (MX record lookup)
  static Future<EmailValidationResult> validateWithDomainCheck(String email) async {
    final result = validate(email);
    if (!result.isValid) return result;

    // Simulate domain check (in real app, you'd do DNS lookup)
    final hasValidDomain = await _checkDomainExists(result.email!);

    if (!hasValidDomain) {
      return EmailValidationResult.invalid(EmailError.invalidDomain);
    }

    return result;
  }

  /// Parse email and return parts
  static EmailParts parse(String email) {
    final normalizedEmail = _normalizeEmail(email);
    final atIndex = normalizedEmail.indexOf('@');

    if (atIndex == -1) {
      throw const FormatException('Invalid email format');
    }

    return EmailParts(
      localPart: normalizedEmail.substring(0, atIndex),
      domain: normalizedEmail.substring(atIndex + 1),
      fullEmail: normalizedEmail,
    );
  }

  // ===========================================================================
  // Private Validation Methods
  // ===========================================================================

  static String _normalizeEmail(String email) {
    return email.trim().toLowerCase();
  }

  static bool _validateSyntax(String email, ValidationLevel level) {
    switch (level) {
      case ValidationLevel.basic:
        return _simpleRegex.hasMatch(email);
      case ValidationLevel.standard:
        return _practicalRegex.hasMatch(email);
      case ValidationLevel.strict:
        return _rfc5322Regex.hasMatch(email);
      case ValidationLevel.rfc:
        return _rfc5322Regex.hasMatch(email) && _validateRfcCompliance(email);
    }
  }

  static EmailError? _validateStructure(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return EmailError.invalidFormat;

    final localPart = parts[0];
    final domain = parts[1];

    // Local part validation
    if (localPart.isEmpty) return EmailError.emptyLocalPart;
    if (localPart.length > 64) return EmailError.localPartTooLong;
    if (localPart.startsWith('.') || localPart.endsWith('.')) {
      return EmailError.invalidLocalPart;
    }
    if (localPart.contains('..')) return EmailError.consecutiveDots;

    // Domain validation
    if (domain.isEmpty) return EmailError.emptyDomain;
    if (domain.length > 253) return EmailError.domainTooLong;
    if (!domain.contains('.')) return EmailError.invalidDomain;
    if (domain.startsWith('-') || domain.endsWith('-')) {
      return EmailError.invalidDomain;
    }
    if (domain.contains('..')) return EmailError.consecutiveDots;

    // TLD validation
    final tld = domain.split('.').last;
    if (tld.length < 2) return EmailError.invalidTld;
    if (_isNumericTld(tld)) return EmailError.numericTld;

    return null;
  }

  static EmailError? _validateAdvanced(String email) {
    final parts = parse(email);

    // Check for common typos in domain
    final domainSuggestions = _checkDomainTypos(parts.domain);
    if (domainSuggestions.isNotEmpty) {
      // We don't return error here, just note it in suggestions
    }

    // Check for unusual characters
    if (_hasUnusualCharacters(parts.localPart)) {
      return EmailError.suspiciousCharacters;
    }

    // Check for common spam patterns
    if (_isPotentialSpam(email)) {
      return EmailError.potentialSpam;
    }

    return null;
  }

  static bool _validateRfcCompliance(String email) {
    // Additional RFC 5322 compliance checks
    final parts = parse(email);

    // Local part in quotes check
    if (parts.localPart.startsWith('"') && !parts.localPart.endsWith('"')) {
      return false;
    }

    // Comments in email (not commonly used)
    if (email.contains('(') || email.contains(')')) {
      // Would need more complex parsing for RFC comments
      return false;
    }

    return true;
  }

  static bool _isDisposableEmail(String email) {
    final domain = parse(email).domain;
    return _disposableDomains.contains(domain);
  }

  static bool _hasValidDomain(String email) {
    final domain = parse(email).domain;
    return domain.contains('.') &&
        domain.length >= 4 && // a.co is shortest valid?
        !domain.startsWith('.') &&
        !domain.endsWith('.');
  }

  static Future<bool> _checkDomainExists(String email) async {
    // This would typically perform DNS MX record lookup
    // For now, return true for demonstration
    return true;
  }

  static bool _isNumericTld(String tld) {
    return double.tryParse(tld) != null;
  }

  static bool _hasUnusualCharacters(String localPart) {
    final unusualCharRegex = RegExp(r"[^\w.!#$%&\'*+/=?^_`{|}~-]");
    return unusualCharRegex.hasMatch(localPart);
  }

  static bool _isPotentialSpam(String email) {
    final spamPatterns = [
      r'\d{6,}@', // Many numbers
      '[a-z]{10,}@', // Very long local part
      r'.*\.(tk|ml|ga|cf)$', // Free domains often used for spam
    ];

    return spamPatterns.any((pattern) => RegExp(pattern).hasMatch(email));
  }

  static List<String> _getSuggestions(String email) {
    final suggestions = <String>[];
    final parts = parse(email);

    // Check for common domain typos
    final domainSuggestions = _checkDomainTypos(parts.domain);
    suggestions.addAll(domainSuggestions);

    // Suggest removing spaces
    if (email.contains(' ')) {
      suggestions.add('Remove spaces from email');
    }

    // Suggest proper capitalization (though email is case-insensitive)
    if (email != email.toLowerCase()) {
      suggestions.add('Email is usually written in lowercase');
    }

    return suggestions;
  }

  static List<String> _checkDomainTypos(String domain) {
    const commonTypos = {
      'gmial.com': 'gmail.com',
      'gmal.com': 'gmail.com',
      'gmail.cmo': 'gmail.com',
      'gmail.con': 'gmail.com',
      'yahhoo.com': 'yahoo.com',
      'yaho.com': 'yahoo.com',
      'hotmal.com': 'hotmail.com',
      'hotmial.com': 'hotmail.com',
      'outloo.com': 'outlook.com',
      'outlok.com': 'outlook.com',
    };

    final suggestions = <String>[];
    if (commonTypos.containsKey(domain)) {
      suggestions.add('Did you mean ${commonTypos[domain]}?');
    }

    return suggestions;
  }
}

// ===========================================================================
// Supporting Classes and Enums
// ===========================================================================

enum ValidationLevel {
  basic, // Simple format check
  standard, // Common email validation
  strict, // Additional structural checks
  rfc, // Full RFC 5322 compliance
}

enum EmailError {
  empty,
  tooLong,
  invalidFormat,
  emptyLocalPart,
  emptyDomain,
  localPartTooLong,
  domainTooLong,
  invalidLocalPart,
  invalidDomain,
  invalidTld,
  consecutiveDots,
  numericTld,
  disposable,
  suspiciousCharacters,
  potentialSpam,
}

class EmailValidationResult {
  EmailValidationResult.valid({
    required this.email,
    this.suggestions = const [],
  })  : isValid = true,
        error = null,
        validatedAt = DateTime.now();

  EmailValidationResult.invalid(this.error, {this.suggestions = const []})
      : isValid = false,
        email = null,
        validatedAt = DateTime.now();
  final bool isValid;
  final EmailError? error;
  final String? email;
  final List<String> suggestions;
  final DateTime validatedAt;

  String? get errorMessage => _errorMessages[error];

  Map<String, dynamic> toJson() => {
        'isValid': isValid,
        'error': error?.name,
        'email': email,
        'suggestions': suggestions,
        'validatedAt': validatedAt.toIso8601String(),
      };

  static const Map<EmailError, String> _errorMessages = {
    EmailError.empty: 'Email cannot be empty',
    EmailError.tooLong: 'Email is too long (max 254 characters)',
    EmailError.invalidFormat: 'Invalid email format',
    EmailError.emptyLocalPart: 'Email local part cannot be empty',
    EmailError.emptyDomain: 'Email domain cannot be empty',
    EmailError.localPartTooLong: 'Email local part is too long (max 64 characters)',
    EmailError.domainTooLong: 'Email domain is too long (max 253 characters)',
    EmailError.invalidLocalPart: 'Invalid local part format',
    EmailError.invalidDomain: 'Invalid domain format',
    EmailError.invalidTld: 'Invalid top-level domain',
    EmailError.consecutiveDots: 'Consecutive dots are not allowed',
    EmailError.numericTld: 'Numeric top-level domains are not allowed',
    EmailError.disposable: 'Disposable email addresses are not allowed',
    EmailError.suspiciousCharacters: 'Email contains suspicious characters',
    EmailError.potentialSpam: 'Email matches common spam patterns',
  };
}

class EmailParts {
  const EmailParts({
    required this.localPart,
    required this.domain,
    required this.fullEmail,
  });
  final String localPart;
  final String domain;
  final String fullEmail;

  String get tld => domain.split('.').last;

  List<String> get domainParts => domain.split('.');

  Map<String, dynamic> toJson() => {
        'localPart': localPart,
        'domain': domain,
        'fullEmail': fullEmail,
        'tld': tld,
        'domainParts': domainParts,
      };
}

// ===========================================================================
// Extension for Easy Usage
// ===========================================================================

extension EmailValidationExtension on String {
  EmailValidationResult validateEmail({
    ValidationLevel level = ValidationLevel.standard,
    bool checkDisposable = true,
    bool checkDomain = false,
  }) {
    return EmailValidator.validate(
      this,
      level: level,
      checkDisposable: checkDisposable,
      checkDomain: checkDomain,
    );
  }

  bool isValidEmail({ValidationLevel level = ValidationLevel.standard}) {
    return EmailValidator.isValid(this, level: level);
  }

  EmailParts parseEmail() {
    return EmailValidator.parse(this);
  }
}
