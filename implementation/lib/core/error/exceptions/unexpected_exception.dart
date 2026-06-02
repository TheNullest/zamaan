import 'package:zamaan/core/error/exceptions/failure.dart';
import 'package:zamaan/shared/domain/enums/failure_type.dart';

/// A class representing an unexpected failure or error.
class UnexpectedException extends Failure {
  UnexpectedException({required super.message, required super.stackTrace, super.timestamp});

  @override
  FailureType get failureType => FailureType.unexpected;
}
