import 'package:zamaan/core/error/exceptions/remote_exception.dart';
import 'package:zamaan/shared/domain/enums/failure_type.dart';

/// A class representing an authentication failure or error.
class CustomAuthException extends RemoteException {
  CustomAuthException({
    required super.message,
    required super.stackTrace,
    super.code,
    super.statusCode,
    super.requestedUrl,
    super.timestamp,
  });

  @override
  FailureType get failureType => FailureType.authentication;
}
