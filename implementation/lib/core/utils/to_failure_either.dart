import 'package:dartz/dartz.dart';
import 'package:zamaan/core/error/exceptions/failure.dart';
import 'package:zamaan/core/error/exceptions/hive_exception.dart';
import 'package:zamaan/core/error/exceptions/local_exception.dart';
import 'package:zamaan/core/error/exceptions/unexpected_exception.dart';
import 'package:zamaan/core/utils/typedef.dart';

/// Converts a caught exception (or any thrown object) into a [Left<Failure>].
///
/// - [e] – the thrown object (Exception, Error, String, etc.)
/// - [stackTrace] – the stack trace at the catch site.
/// - [rollbackActions] – optional list of async functions that will be awaited
///   **before** the failure is returned (useful for compensating transactions).
/// - [customMessage] – optional additional context added to the error message.
///
/// Returns [Future<Either<Failure, T>>] where [T] is inferred from the context.
///
/// Example:
/// ```dart
/// return toFailureEither<TaskEntity>(
///   e: e,
///   stackTrace: stackTrace,
///   rollbackActions: [() => transactionManager.rollback()],
///   customMessage: 'Failed to save task',
/// );
/// ```
EResultFuture<T> toFailureEither<T>({
  required dynamic e,
  required StackTrace stackTrace,
  List<Future<void> Function()>? rollbackActions,
  String? customMessage,
}) async {
  // Execute rollback actions before handling the error
  if (rollbackActions != null) {
    for (final action in rollbackActions) {
      await action();
    }
  }

  final formattedMessage = customMessage != null ? '\n ** $customMessage **' : '';

  // Already a Failure – just wrap in Left
  if (e is Failure) {
    return Left(e);
  }

  // FormatException (local data parsing error)
  if (e is FormatException) {
    final exception = LocalException(
      message: '${e.message}$formattedMessage',
      stackTrace: stackTrace,
    );
    return Left(exception);
  }

  // Hive database error check via string verification or engine duck-typing
  // (Avoids importing package:hive_ce_flutter/hive_flutter.dart into core)
  final errorString = e.toString();
  if (errorString.contains('HiveError') || e.runtimeType.toString() == 'HiveError') {
    return Left(HiveException(message: '$errorString$formattedMessage', stackTrace: stackTrace));
  }

  // Any other exception (including Strings, Errors, etc.)
  return Left(
    UnexpectedException(message: '$errorString$formattedMessage', stackTrace: stackTrace),
  );
}
