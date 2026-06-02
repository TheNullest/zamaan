import 'package:zamaan/core/error/exceptions/failure.dart';
import 'package:zamaan/shared/domain/enums/failure_type.dart';

/// A class representing a local failure or error.
class LocalException extends Failure {
  LocalException({required super.message, required super.stackTrace, super.timestamp});

  @override
  FailureType get failureType => FailureType.local;
}
